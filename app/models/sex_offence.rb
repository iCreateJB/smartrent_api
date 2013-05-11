class SexOffence
  include Ripple::EmbeddedDocument
  
  property :search_id,            Integer,  :presence => true
  property :first_name,           String,   :presence => true
  property :last_name,            String,   :presence => true
  property :native_record_number, String,   :presence => true
  property :component_id,         String,   :presence => true
  property :category,             String,   :presence => true
  property :status,               String,   :presence => true
  property :created,              Date,   :presence => true
  
end
