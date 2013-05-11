FactoryGirl.define do
  factory :address do
    street "199 S. Los Robles Ave."
    city "Pasadena"
    state "CA"
    zip "93063"
    monthly_rent "1150.00"
  end

  factory :address_with_landlord, :parent => :address do
    landlord_name "John Landy"
    landlord_email 'jlandy@example.com'
    landlord_phone "555-123-4567"
  end
end
