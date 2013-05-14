FactoryGirl.define do
  factory :unconfirmed_renter, :class => Renter do
    first_name            "Austin"
    last_name             "Test"
    sequence(:email)      {|n| "user_#{n}@renterexample.com" }
    renting_in_state_code "CA"
  end

  factory :renter, :parent => :unconfirmed_renter do
    confirmed_at Time.now - 1.day
  end
end
