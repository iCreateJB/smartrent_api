require 'orm_adapter/adapters/ripple'

class Renter
  include Ripple::Document

  property :first_name, String
  property :last_name, String
  property :email, String
  property :renting_in_state_code, String
  property :view_transmit_helper, Boolean, :default => false
  property :confirmed_at, DateTime
  property :last_sign_in, DateTime
  property :sign_in_count, Integer

  one  :current_application, :class_name => "RentalApplication"
  many :sent_rental_applications, :class_name => "SentRentalApplication"

end
