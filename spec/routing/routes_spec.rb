require 'spec_helper'

describe "Routes" do 
  it "GET => '/v2/renter_enrollments'" do 
    expect(:get => '/v2/renter_enrollments').to route_to(:controller => 'enrollments', :action => 'show', :type => "renter")
  end

  it "GET => '/v2/landlord_enrollments'" do 
    expect(:get => '/v2/landlord_enrollments').to route_to(:controller => 'enrollments', :action => 'show', :type => "landlord")
  end

  it "GET => '/v2/landlords'" do 
    expect(:get => '/v2/landlords').to route_to(:controller => 'landlords', :action => 'show')
  end

  it "GET => '/v2/renters'" do 
    expect(:get => '/v2/renters').to route_to(:controller => 'renters', :action => 'show')
  end

  it "GET => '/v2/status'" do 
    expect(:get => '/v2/status').to route_to(:controller => 'index', :action => 'show')
  end
end