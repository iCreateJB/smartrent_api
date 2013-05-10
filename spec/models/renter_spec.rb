require 'spec_helper'

describe Renter do 
  it { Renter.properties.include?(:first_name).should be_true }
  it { Renter.properties.include?(:last_name).should be_true }
  it { Renter.properties.include?(:email).should be_true }
  it { Renter.properties.include?(:renting_in_state_code).should be_true }
  it { Renter.properties.include?(:view_transmit_helper).should be_true }
  it { Renter.properties.include?(:confirmed_at).should be_true }
  it { Renter.properties.include?(:last_sign_in).should be_true }
  it { Renter.properties.include?(:sign_in_count).should be_true }

  it { Renter.associations.include?(:current_application).should be_true }
  it { Renter.associations.include?(:sent_rental_applications).should be_true }

  subject{ Renter.new }

  it { subject.class.should respond_to(:unconfirmed_accounts) }
  it { subject.class.should respond_to(:enrolled_accounts) }
  it { subject.class.should respond_to(:enrolled_by_date) }
end