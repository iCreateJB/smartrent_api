require 'spec_helper'

describe IndexController do 
  let(:key){ FactoryGirl.create(:api_key) }

  before(:each) do 
    key
  end

  it { should respond_to(:show) }

  it "should return the system status if up" do 
    request.env['AUTHORIZATION'] = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), key.secret, URI.decode({:api_key => key.key}.to_query)))
    response = get :show, :api_key => key.key, :format => :json
    JSON(response.body)['status'].should == 'OK'
  end
end