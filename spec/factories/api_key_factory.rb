FactoryGirl.define do
  factory :api_key do
    key SecureRandom.hex(16)
    secret SecureRandom.hex(16)
    sequence(:email)  {|n| "api.user#{n}@smartrent.com" }
  end
end
