SmApi::Application.routes.draw do
  scope '/v1', :via => :get do 
    match 'renter_enrollments'   => "enrollments#show",      :type => "renter"
    match 'landlord_enrollments' => "enrollments#show",      :type => "landlord"
    match 'landlords'            => "landlords#show"
    match 'renters'              => "renters#show"
    match 'status'               => "index#show"
  end
end
