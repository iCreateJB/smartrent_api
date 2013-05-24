require 'orm_adapter/adapters/ripple'

class ApiKey 
  include Ripple::Document

  property :access_token, String
  timestamps!

  before_create :generate_access_token
  
private
  
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while !self.class.find_with_conditions(access_token: access_token).empty?
  end
end