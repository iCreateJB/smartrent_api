FactoryGirl.define do
  factory :unconfirmed_renter, :class => Renter do
    first_name            "Austin"
    last_name             "Test"
    sequence(:email)      {|n| "user_#{n}@renterexample.com" }
    renting_in_state_code "CA"
    password              ::TEST_PASSWORD
    password_confirmation ::TEST_PASSWORD
  end

  factory :renter, :parent => :unconfirmed_renter do
    confirmed_at Time.now - 1.day
    confirmation_token 'a_token'
  end
end
