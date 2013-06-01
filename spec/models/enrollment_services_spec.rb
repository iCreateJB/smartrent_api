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
  it { should respond_to(:valid?) }

  it "should return renter enrollments" do 
    subject.enrollments_by_date.enrollments.include?(renter).should be_true
  end

  it "should return landlord enrollments" do 
    options.merge!(:type => "landlord")
    subject.enrollments_by_date.enrollments.include?(renter).should_not be_true
  end

  context "date ranges" do 
    it "should not return renter enrollments" do 
      options.merge!(:start_date => 'SM_api')
      subject.enrollments_by_date.valid?.should be_false
    end

    it "should return renter enrollments" do 
      options.merge!(:start_date => Date.today.strftime('%Y-%m-%d'))
      subject.enrollments_by_date.valid?.should be_true
    end

    it "should not return landlord enrollments" do 
      options.merge!(:end_date => 'SM_api')
      subject.enrollments_by_date.valid?.should be_false
    end

    it "should return landlord enrollments" do 
      options.merge!(:end_date => Date.today.strftime('%Y-%m-%d'))
      subject.enrollments_by_date.valid?.should be_true
    end
  end

end