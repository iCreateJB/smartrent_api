class Job
  include Ripple::EmbeddedDocument

  property :business_name, String, :presence => true
  property :title, String, :presence => true
  property :monthly_income, Integer
  property :less_than_a_year, Boolean, :default => false
  property :current_position, Boolean, :default => nil
  property :monthly_income, String

  one :address
  one :duration
  one :supervisor, :class_name => "Reference"

  accepts_nested_attributes_for :address, :duration, :supervisor

end
