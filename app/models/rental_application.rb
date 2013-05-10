class RentalApplication
  include Ripple::Document
  include Ripple::Timestamps

  property :cc_expiration, DateTime
  property :agreed_to_toc, :boolean
  property :multiple_sources_of_income, Boolean
  property :has_a_pet, Boolean
  property :phone, String
  property :expected_move_in_date, Date
  property :one_year_or_more, Boolean, :default => nil
  property :current_address_is_billing_address, Boolean, :default => nil
  property :background_check_saved, Boolean, :default => false
  property :payment_processed_popup, Boolean, :default => nil
  property :paid_on, DateTime, :default => nil
  property :application_ref_number, String
  property :recorded_on, DateTime, :default => nil
  property :other_occupants, Boolean, :default => nil
  property :has_pets, Boolean, :default => nil
  property :additional_occupants, Boolean, :default => nil
  property :additional_pets, Boolean, :default => nil
  property :employment_status, String  
  property :additional_income, String
  property :additional_income_source, String
  timestamps!

  one :renter, :class_name => "Renter"
  one :credit_report
  one :current_address, :class_name => "Address"
  one :billing_address, :class_name => "Address"
  one :prior_address, :class_name => "Address"  
  one :current_job, :class_name => "Job"
  one :previous_job, :class_name => "Job"
  one :primary, :class_name => "Occupant"

  many :pets
  many :occupants
  many :evictions
  many :criminal_offences  

end