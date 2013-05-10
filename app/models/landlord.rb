require 'orm_adapter/adapters/ripple'

class Landlord
  include Ripple::Document

  property :first_name, String
  property :last_name, String
  property :title, String
  property :phone, String
  property :fax, String
  property :website, String
  property :company, String
  property :email, String
  property :description, String

  one  :work_address, :class_name => "Address"
  many :sent_rental_applications, :class_name => "RentalApplication"

  accepts_nested_attributes_for :work_address

end
