require 'spec_helper'

describe IndexController do 
  it { should respond_to(:show) }

  it "should return the system status if up" do 
    response = get :show, :format => :json
    JSON(response.body)['status'].should == 'OK'
  end
end