require 'spec_helper'

describe SentRentalApplication do 
  it { SentRentalApplication.properties.include?(:note).should be_true }
  it { SentRentalApplication.properties.include?(:sent_on).should be_true }
  it { SentRentalApplication.properties.include?(:agreed_on).should be_true }

  it { SentRentalApplication.associations.include?(:rental_address).should be_true }
  it { SentRentalApplication.associations.include?(:landlord).should be_true }
end