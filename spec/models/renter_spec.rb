require 'spec_helper'

describe Renter do 
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }

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

  before(:each) do 
    renter
  end

  it { subject.class.should respond_to(:unconfirmed_accounts) }
  it { subject.class.should respond_to(:enrolled_accounts) }
  it { subject.class.should respond_to(:enrolled_by_date) }

  it "should return all enrolled accounts" do 
    FactoryGirl.create(:renter, :confirmed_at => nil)
    subject.class.enrolled_accounts.size.should == 1
  end

  it "should return all confirmed enrollments_by_date" do 
    subject.class.enrolled_by_date.include?(renter).should be_true
  end

  it "should return all unconfirmed enrollments" do 
    renter.confirmed_at = nil
    renter.save
    subject.class.unconfirmed_accounts.include?(renter).should be_true
  end
end