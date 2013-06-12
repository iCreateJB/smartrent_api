require 'spec_helper'

describe EnrollmentsController do
  let(:key){ FactoryGirl.create(:api_key) }
  let(:renter){ FactoryGirl.create(:renter, :confirmed_at => Date.today) }
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today) }
  
  it { should respond_to(:show) }

  before(:each) do 
    key
    renter
    landlord
  end

  it "should return enrollment information (renter) " do 
    request.env['AUTHORIZATION'] = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), key.secret, URI.decode({:api_key => key.key}.to_query)))
    response = get :show, :api_key => key.key, :type => "renter", :format => :json
    JSON.parse(response.body)['enrollments'].first['email'].should == renter.email
  end

  it "should return enrollment information (landlord) " do 
    request.env['AUTHORIZATION'] = Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), key.secret, URI.decode({:api_key => key.key}.to_query)))
    response = get :show, :api_key => key.key, :type => "landlord", :format => :json
    JSON.parse(response.body)['enrollments'].first['email'].should == landlord.email
  end
end
