require 'orm_adapter/adapters/ripple'

class ApiKey 
  include Ripple::Document

  property :key, String
  property :secret, String
  property :email, String
  timestamps!

  before_create :generate_key
  before_create :generate_secret

  validate :unique_email

  def unique_email
    ApiKey.find_with_conditions(email: email).empty? ? true : false
  end
  
private
  
  def generate_key
    begin
      self.key = SecureRandom.hex
    end while !self.class.find_with_conditions(key: key).empty?
  end

  def generate_secret
    begin
      self.secret = SecureRandom.hex
    end while !self.class.find_with_conditions(secret: secret).empty?
  end
end