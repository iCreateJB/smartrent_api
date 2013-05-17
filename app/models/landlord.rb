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
  property :confirmed_at, DateTime

  one  :work_address, :class_name => "Address"
  many :sent_rental_applications, :class_name => "RentalApplication"

  accepts_nested_attributes_for :work_address

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
