require 'orm_adapter/adapters/ripple'
require 'active_model/validations'

class CampaignEmail
  include Ripple::Document
  include ActiveModel::Validations

  property :email, String
  property :source, String
  timestamps!

  validate :existing_email

  def existing_email
    if !CampaignEmail.find_with_conditions(:email => self.email).empty?
      errors.add(:email, 'must be unique')
    end
  end
  
end