SmApi::Application.routes.draw do
  scope '/v1', :via => :get do 
    match 'renter_enrollments'   => "enrollments#show",      :type => "renter"
    match 'landlord_enrollments' => "enrollments#show",      :type => "landlord"
    match 'landlord'             => "landlords#show"
    match 'renter'               => "renters#show"
    match 'status'               => "index#show"
  end
end
