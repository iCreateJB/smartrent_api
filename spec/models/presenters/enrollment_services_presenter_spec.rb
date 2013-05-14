require 'spec_helper'

describe EnrollmentServicesPresenter do 
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    Renter.enrolled_accounts
  }

  subject{ EnrollmentServicesPresenter.new(options) }

  before(:each) do 
    renter
  end

  it { should respond_to(:response) }
  it { should respond_to(:renters) }
  it { subject.class.should respond_to(:response) }

  it "should return all enrolled accounts as JSON" do 
    JSON.parse(subject.response)["count"].should == 1
  end

  it "should return all the renters" do 
    subject.renters.should be_an_instance_of(Array)
  end

  context "response" do 
    before(:each) do 
      @response = JSON.parse(subject.response)
    end

    it "should return the count" do 
      @response.has_key?("count").should be_true
    end

    it "should return an array of enrollments" do 
      @response.has_key?("enrollments").should be_true
    end
  end
end