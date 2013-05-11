class Residence
  include Ripple::EmbeddedDocument

  property :rent, String, :presence => true
  property :reason_for_leaving, String
  
  one :address
  one :duration
  one :landlord, :class_name => "Reference"  

  accepts_nested_attributes_for :address, :duration, :landlord
end
