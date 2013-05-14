FactoryGirl.define do
  factory :unconfirmed_landlord, :class => Landlord do
    first_name            "Austin"
    last_name             "Fonacier"
    phone                 "818 123 1234"
    sequence(:email)      {|n| "user_#{n}@landlordexample.com" }
  end
  
  factory :landlord, :parent => :unconfirmed_landlord do
    confirmed_at Time.now - 1.day
  end
end