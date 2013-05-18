require 'spec_helper'

describe "Routes" do 
  it "GET => '/v1/renter_enrollments'" do 
    expect(:get => '/v1/renter_enrollments').to route_to(:controller => 'enrollments', :action => 'show', :type => "renter")
  end

  it "GET => '/v1/landlord_enrollments'" do 
    expect(:get => '/v1/landlord_enrollments').to route_to(:controller => 'enrollments', :action => 'show', :type => "landlord")
  end

  it "GET => '/v1/landlord'" do 
    expect(:get => '/v1/landlord').to route_to(:controller => 'landlords', :action => 'show')
  end

  it "GET => '/v1/renter'" do 
    expect(:get => '/v1/renter').to route_to(:controller => 'renters', :action => 'show')
  end

  it "GET => '/v1/status'" do 
    expect(:get => '/v1/status').to route_to(:controller => 'index', :action => 'show')
  end
end