require 'spec_helper'

describe LandlordsController do
  let(:key){ FactoryGirl.create(:api_key) }
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today )}

  it { should respond_to(:show)}

  before(:each) do 
    key
    landlord
  end

  it "should return landlord information" do 
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(key.access_token)
    response = get :show, :landlord => landlord.email, :format => :json
    JSON.parse(response.body)['email'].should == landlord.email
  end
end
