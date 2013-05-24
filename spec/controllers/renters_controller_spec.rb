require 'spec_helper'

describe RentersController do
  let(:key){ FactoryGirl.create(:api_key) }  
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  
  it { should respond_to(:show) }

  before(:each) do 
    key
    renter
  end

  it "should return renter information" do 
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(key.access_token)    
    response = get :show, :renter => renter.email, :format => :json
    JSON.parse(response.body)['email'].should == renter.email
  end
end
