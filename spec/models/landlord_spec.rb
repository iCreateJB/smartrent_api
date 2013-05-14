require 'spec_helper'

describe Landlord do 
  it { Landlord.properties.include?(:first_name).should be_true }
  it { Landlord.properties.include?(:last_name).should be_true }
  it { Landlord.properties.include?(:title).should be_true }
  it { Landlord.properties.include?(:phone).should be_true }
  it { Landlord.properties.include?(:fax).should be_true }
  it { Landlord.properties.include?(:website).should be_true }
  it { Landlord.properties.include?(:company).should be_true }
  it { Landlord.properties.include?(:email).should be_true }
  it { Landlord.properties.include?(:description).should be_true }
  it { Landlord.properties.include?(:confirmed_at).should be_true }

  it { Landlord.associations.include?(:work_address).should be_true }
  it { Landlord.associations.include?(:sent_rental_applications).should be_true }
end