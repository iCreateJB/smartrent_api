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
    request.env['AUTHORIZATION'] = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), key.secret, URI.decode({:api_key => key.key, :email => landlord.email}.to_query)))
    response = get :show, :api_key => key.key, :email => landlord.email, :format => :json
    JSON.parse(response.body)['email'].should == landlord.email
  end
end
