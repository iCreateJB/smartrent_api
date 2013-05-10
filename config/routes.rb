SmApi::Application.routes.draw do
  scope '/v1' do 
    match 'enrollments'   => "enrollments#show",       :via => :get
    match 'applications'  => "landlords#applications", :via => :get
  end
end
