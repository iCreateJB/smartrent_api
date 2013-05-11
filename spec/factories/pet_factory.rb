FactoryGirl.define do
  factory :pet do
    name "Pam"
    weight "180"
    kind {Pet::KINDS[0]}
    breed "Black Cat"
  end
end
