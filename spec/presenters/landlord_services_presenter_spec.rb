require 'spec_helper'

describe LandlordServicesPresenter do 
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today )}
  let(:sent_rental_application){ FactoryGirl.create(:sent_rental_application) }
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {
      :landlord => landlord,
      :applications => [
        {
          :renter => sent_rental_application.landlord.email,
          :street   => sent_rental_application.rental_address.street,
          :city     => sent_rental_application.rental_address.city,
          :postal   => sent_rental_application.rental_address.zip,
          :sent_on  => sent_rental_application.sent_on
        }
      ]
    }
  }

  subject{ LandlordServicesPresenter.new(options) }

  before(:each) do 
    landlord
    landlord.sent_rental_applications << sent_rental_application
    landlord.save
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
    it { @response.has_key?(:sent_rental_applications).should be_true }
    it { @response.has_key?(:confirmed_at).should be_true }
    it { @response.has_key?(:applications).should be_true }
  end
end