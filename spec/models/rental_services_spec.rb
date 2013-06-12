require 'spec_helper'

describe RentalServices do 
  let(:sent_rental_application){ FactoryGirl.create(:sent_rental_application) }
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {
      :email => renter.email
    }
  }

  subject{ RentalServices.new(options) }

  before(:each) do 
    renter
    renter.sent_rental_applications << sent_rental_application
    renter.save
  end

  it { should respond_to(:sent_applications) }
  it { should respond_to(:summary) }

  it { subject.class.should respond_to(:summarize) }

  it "should return the sent_applications" do 
    subject.sent_applications.size.should == 1
  end

  it "should return the summary" do 
    subject.summary[:renter].should == renter
  end
end