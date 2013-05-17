SmApi::Application.routes.draw do
  scope '/v1', :via => :get do 
    match 'renter_enrollments'   => "enrollments#show",      :type => "renter"
    match 'landlord_enrollments'=> "enrollments#show",      :type => "landlord"
    match 'applications'  => "landlords#applications"
    match 'renter'        => "renters#show"
  end
end
