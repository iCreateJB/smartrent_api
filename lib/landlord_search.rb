require 'cgi'
require 'rss'
require 'open-uri'
require 'typhoeus'

module LandlordSearch
  class Craigslist
    attr_accessor :city, :data, :feed

    def self.search(options={})
      self.new(options).search
    end

    def self.search_all
      [
        { :city => 'New York',    :feed => 'http://newyork.craigslist.org/aap/index.rss' },
        { :city => 'Los Angeles', :feed => 'http://losangeles.craigslist.org/apa/index.rss'},
        { :city => 'Philadelphia',:feed => 'http://philadelphia.craigslist.org/apa/index.rss'},
        { :city => 'Chicago',     :feed => 'http://chicago.craigslist.org/apa/index.rss'},
        { :city => 'Houston',     :feed => 'http://houston.craigslist.org/apa/index.rss'},
        { :city => 'Dallas',      :feed => 'http://dallas.craigslist.org/apa/index.rss'}
      ].each do |i|
        self.new(i).search
      end
    end

    def initialize(options={})
      @city = options[:city]
      @feed = options[:feed]
    end

    def search
      open(@feed) do |rss|
        feed = RSS::Parser.parse(rss)
        # puts "Title: #{feed.channel.title}"
        puts "[#{@city}]"
        feed.items.each do |item|
          # puts "Item: #{item.title}"
          # puts "Item: #{item.description}"
          item.description.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i) { |x| puts x }
        end
      end
    end
  end

  class Google
    # key = AIzaSyAl0iLKMf2Ryt6JTC6Jmong3LMoWP6lVMg
    # cx  = 013787057236078716984:dd6dnxoiolg
    # 1: @gmail.com apts/housing for rent site:losangeles.craigslist.org
    # 2: @yahoo.com apts/housing for rent site:losangeles.craigslist.org
    # sample run: curl -L -G -d "key=AIzaSyAl0iLKMf2Ryt6JTC6Jmong3LMoWP6lVMg&cx=013787057236078716984:dd6dnxoiolg&q=%40gmail.com+apts%2Fhousing+for+rent+site%3Alosangeles.craigslist.org&alt=json" https://www.googleapis.com/customsearch/v1
    attr_accessor :search_terms, :data, :emails

    def self.search(options={})
      self.new(options).search
    end

    def initialize(options={})
      @search_terms = options[:search_terms]
      @data         = nil
      @emails       = []
    end

    def search
      response = Typhoeus.get('https://www.googleapis.com/customsearch/v1', params: { key: ENV['key'], cx: ENV['cx'], q: @search_terms, alt: 'json' } )
      @data    = JSON.parse(response.body)
      limit    = @data['searchInformation']['totalResults'].to_i

      if limit.to_i > 0
        parse_for_email(@data)
        start    = @data['queries']['request'][0]['startIndex'].to_i        
        start.step(limit,10) do |u|
          response = Typhoeus.get('https://www.googleapis.com/customsearch/v1', params: { key: ENV['key'], cx: ENV['cx'], q: @search_terms, start: u, alt: 'json' } )
          parse_for_email(JSON.parse(response.body))
        end
      end
    end

  private
    def parse_for_email(data)
      if !data['items'].blank?
        data['items'].map{ |i| i['snippet'].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i) { |x| @emails.push(x) } }        
        @emails.each do |i|
          begin
              (CampaignEmail.create(:email => i, :source => ENV['source']) == true) ? true : raise
          rescue
            Rails.logger.debug "[Duplicate Email Address] #{i}"
          end
        end
        @emails.clear      
      end
    end
  end

  class Reports
    require 'csv'

    def self.export
      CSV.open("#{Date.today.strftime('%Y-%m-%d')}.results.csv", "w") do |csv|
        csv << ["city", "email", "recorded on"]
        CampaignEmail.find_with_conditions(:source => ENV['source']).each do |i|
          csv << [ i.source, i.email, i.created_at.strftime('%Y-%m-%d')]
        end
      end
    end
  end
end