require 'spec_helper'

describe LandlordServices do 
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today)}
  let(:sent_rental_application){ FactoryGirl.create(:sent_rental_application) }
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {
      :landlord => landlord.email
    }
  }

  subject{ LandlordServices.new(options) }

  before(:each) do 
    landlord
    landlord.sent_rental_applications << sent_rental_application
    landlord.save
  end

  it { should respond_to(:sent_applications) }
  it { should respond_to(:summary) }

  it { subject.class.should respond_to(:summarize) }

  it "should return the sent_applications" do 
    subject.sent_applications.size.should == 1
  end

  it "should return the summary" do 
    subject.summary[:landlord].should == landlord
  end
end