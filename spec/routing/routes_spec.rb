require 'spec_helper'

describe "Routes" do 
  it "GET => '/v1/enrollments'" do 
    expect(:get => '/v1/enrollments').to route_to(:controller => 'enrollments', :action => 'show')
  end

  it "GET => '/v1/applications'" do 
    expect(:get => '/v1/applications').to route_to(:controller => 'landlords', :action => 'applications')
  end
end