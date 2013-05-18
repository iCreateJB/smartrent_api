require 'spec_helper'

describe EnrollmentsController do
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today) }
  
  it { should respond_to(:show) }

  before(:each) do 
    renter
    landlord
  end

  it "should return enrollment information (renter) " do 
    response = get :show, :type => "renter", :format => :json
    JSON.parse(response.body)['enrollments'].first['email'].should == renter.email
  end

  it "should return enrollment information (landlord) " do 
    response = get :show, :type => "landlord", :format => :json
    JSON.parse(response.body)['enrollments'].first['email'].should == landlord.email
  end
end
