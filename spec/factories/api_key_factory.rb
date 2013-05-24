FactoryGirl.define do
  factory :api_key do
    access_token SecureRandom.hex(16)
  end
end
