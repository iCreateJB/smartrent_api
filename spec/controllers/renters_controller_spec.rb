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
    request.env['AUTHORIZATION'] = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), key.secret, URI.decode({:api_key => key.key, :email => renter.email}.to_query)))
    response = get :show, :api_key => key.key, :email => renter.email, :format => :json
    JSON.parse(response.body)['email'].should == renter.email
  end
end
