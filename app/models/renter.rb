require 'orm_adapter/adapters/ripple'

class Renter
  include Ripple::Document

  property :first_name, String
  property :last_name, String
  property :email, String, :index => String
  property :renting_in_state_code, String
  property :view_transmit_helper, Boolean, :default => false
  property :confirmed_at, DateTime
  property :last_sign_in, DateTime
  property :sign_in_count, Integer

  one  :current_application, :class_name => "RentalApplication"
  many :sent_rental_applications, :class_name => "SentRentalApplication"

  # scopes
  def self.unconfirmed_accounts
    find_with_conditions(:confirmed_at => nil)
  end

  def self.enrolled_accounts
    list.delete_if{ |i| i.confirmed_at.nil? }
  end

  def self.enrolled_by_date(options={})
    case 
    when options.has_key?(:start_date) && options.has_key?(:end_date)
      enrolled_accounts.keep_if{ |u| u.confirmed_at >= options[:start_date].to_datetime && u.confirmed_at <= options[:end_date].to_datetime }
    when options.has_key?(:start_date) && !options.has_key?(:end_date)
      enrolled_accounts.keep_if{ |u| u.confirmed_at >= options[:start_date].to_datetime }
    when !options.has_key?(:start_date) && options.has_key?(:end_date)      
      enrolled_accounts.keep_if{ |u| u.confirmed_at <= options[:end_date].to_datetime }
    else
      enrolled_accounts
    end
  end

end
