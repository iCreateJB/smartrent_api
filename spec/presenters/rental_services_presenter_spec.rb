require 'spec_helper'

describe RentalServicesPresenter do 
  let(:sent_rental_application){ FactoryGirl.create(:sent_rental_application) }
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {
      :renter => renter,
      :applications => [
        {
          :landlord => sent_rental_application.landlord.email,
          :street   => sent_rental_application.rental_address.street,
          :city     => sent_rental_application.rental_address.city,
          :postal   => sent_rental_application.rental_address.zip,
          :sent_on  => sent_rental_application.sent_on
        }
      ]
    }
  }

  subject{ RentalServicesPresenter.new(options) }

  before(:each) do 
    renter
    renter.sent_rental_applications << sent_rental_application
    renter.save
  end

  it { should respond_to(:response) }
  it { subject.class.should respond_to(:response) }

  it "should return the response" do 
    subject.response.has_key?(:email).should be_true
  end

  context "response" do 
    before(:each) do 
      @response = subject.response
    end

    it { @response.has_key?(:email).should be_true }
    it { @response.has_key?(:first_name).should be_true }
    it { @response.has_key?(:last_name).should be_true }
    it { @response.has_key?(:renting_in_state_code).should be_true }
    it { @response.has_key?(:sent_rental_applications).should be_true }
    it { @response.has_key?(:confirmed_at).should be_true }
    it { @response.has_key?(:applications).should be_true }
  end
end