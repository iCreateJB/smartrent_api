require 'spec_helper'

describe EnrollmentServices do 
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {
      :type => "renter"
    } 
  }

  before(:each) do 
    renter
  end

  subject{ EnrollmentServices.new(options) }

  it { should respond_to(:enrollments_by_date) }
  it { subject.class.should respond_to(:by_date) }

  it "should return renter enrollments" do 
    subject.enrollments_by_date.include?(renter).should be_true
  end

  it "should return landlord enrollments" do 
    options.merge!(:type => "landlord")
    subject.enrollments_by_date.include?(renter).should_not be_true
  end

end