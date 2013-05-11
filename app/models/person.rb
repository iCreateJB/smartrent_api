class Person
  include Ripple::EmbeddedDocument

  property :prefix_name, String
  property :suffix_name, String
  property :full_name, String
  property :given_name, String
  property :maiden_name, String
  property :middle_name, String
  property :sur_name, String
  
end