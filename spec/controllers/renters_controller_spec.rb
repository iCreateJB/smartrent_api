require 'spec_helper'

describe RentersController do
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  
  it { should respond_to(:show) }

  before(:each) do 
    renter
  end

  it "should return renter information" do 
    response = get :show, :renter => renter.email, :format => :json
    JSON.parse(response.body)['email'].should == renter.email
  end
end
