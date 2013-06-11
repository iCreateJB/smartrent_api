require 'ripple'

module Ripple::Document
  module ClassMethods
    include OrmAdapter::ToAdapter

    #I usually don't like to comment a whole lot, but in the interest of
    #smoothing this out:
    #
    #A general finder (a la AR::B::all(:conditions => conditions)
    #
    #Performance in the general case will likely be poor.  Nothing empirical
    #behind that, and we hope not to need the general case.
    def find_with_conditions(conditions)
      #R::MR can either be chained, or take a block to ::new.  Because the
      #phases depend on input, I'm using re-assignment
      #
      #A Bare MR
      riak = Riak::MapReduce.new(bucket.client)

      index_key = conditions.keys.find{|key| indexes[key]}
      if true or index_key.nil?
        riak.add(bucket)
      else
        queried_index = indexes[index_key]
        riak.index(bucket,
                   queried_index.index_key,
                   conditions[queried_index.key] ||
                   conditions[queried_index.key.to_s])
        #Remove the index from the conditions: it's already selected for
        conditions.delete(queried_index.key)
        conditions.delete(queried_index.key.to_s)
      end

      #XXX Optimization candidate: install app/mapreduce as a js_source_dir,
      #and use JS from there - functions loaded per JS VM, not per query.
      filter_by_fields = <<-EOJS
      function(value, keyData, fields){
        var object = Riak.mapValuesJson(value)[0];
        for(field in fields){
          if(object[field] != fields[field])
            return [];
        }
        return [[value.bucket, value.key]];
      }
      EOJS
      #We have a couple of options here, but Ripple.filterByFields is defined
      #in app/mapreduce i.e. it comes with Ripple.
      #Upshot: return [bucket, key] for each document with fields that match
      #the conditions
      riak.map(filter_by_fields, :arg => conditions, :keep => true)


      #Run the query and
      #Select all the pairs that match my bucket (although how any others got
      #in there, I'm at a loss...) - possible optimization by adding a map
      #phase to filter by bucket as well
      keys = riak.run.find_all do |bucket, key|
        bucket == bucket_name
      #Map the resulting bucket,key pairs into keys
      end.map do |bucket, key|
        key
      end
      #And have Ripple load objects for all the keys
      return [*find(*keys)]
    end
  end

  class OrmAdapter < ::OrmAdapter::Base

    # Do not consider these to be part of the class list
    def self.except_classes
      @@except_classes ||= [
      ]
    end

    # Gets a list of the available models for this adapter
    def self.model_classes
      ObjectSpace.each_object(Class).to_a.select {|klass| klass.ancestors.include? Ripple::Document}
    end

    # Return list of column/property names
    def column_names
      klass.properties.keys
    end

    # @see OrmAdapter::Base#get!
    def get!(id)
      klass.find(wrap_key(id))
    end

    # @see OrmAdapter::Base#get
    def get(id)
      klass.find(wrap_key(id))
      #klass.first :conditions => { klass.primary_key => wrap_key(id) }
    end

    # @see OrmAdapter::Base#find_first
    def find_first(options)
      return (find_all(options)||[]).first
#      conditions, order = extract_conditions_and_order!(options)
#      p :conditions => conditions, :order => order
#      if order.blank?
#        klass.ids_from_conditions(conditions).first
#      else
#        #jdl: I think we can ignore this?  Order is for "ORDER BY name ASC" etc
#        raise "Need to write this - couldn't until I had an example of order"
#      end
    end

    # @see OrmAdapter::Base#find_all
    def find_all(options)
      conditions, order = extract_conditions!(options)
      if order.blank?
        klass.find_with_conditions(conditions)
      else
        #jdl: I think we can ignore this?  Order is for "ORDER BY name ASC" etc
        raise "Need to write this - couldn't until I had an example of order"
      end
    end

    # @see OrmAdapter::Base#create!
    def create!(attributes)
      klass.create!(attributes)
    end


  protected

  #Maybe this gets retained?  I'm not clear on the value of it...
   # converts and documents to ids
      def conditions_to_fields(conditions)
        conditions.inject({}) do |properties, (key, value)|
          if value.is_a?(Ripple::Document) && klass.properties.keys.include?("#{key}_id")
            properties.merge("#{key}_id" => value.id)
          else
            properties.merge(key => value)
          end
        end
      end

    def order_clause(order)
      order.map {|pair| "#{pair[0]} #{pair[1]}"}.join(",")
    end
  end
end
