require 'spec_helper'

describe EnrollmentServices do 
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:options){
    {

    }
  }

  before(:each) do 
    renter
  end

  subject{ EnrollmentServices.new(options) }

  it { should respond_to(:enrollments_by_date) }
  it { subject.class.should respond_to(:by_date) }

  it "should return all enrollments" do 
    subject.enrollments_by_date.include?(renter).should be_true
  end

end