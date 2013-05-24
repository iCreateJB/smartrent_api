require 'spec_helper'

describe IndexController do 
  let(:key){ FactoryGirl.create(:api_key) }

  before(:each) do 
    key
  end

  it { should respond_to(:show) }

  it "should return the system status if up" do 
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(key.access_token)
    response = get :show, :format => :json
    JSON(response.body)['status'].should == 'OK'
  end
end