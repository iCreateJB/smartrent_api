require 'spec_helper'

describe LandlordsController do
  let(:landlord){ FactoryGirl.create(:landlord, :confirmed_at => Date.today )}

  it { should respond_to(:show)}

  before(:each) do 
    landlord
  end

  it "should return landlord information" do 
    response = get :show, :landlord => landlord.email, :format => :json
    JSON.parse(response.body)['email'].should == landlord.email
  end
end
