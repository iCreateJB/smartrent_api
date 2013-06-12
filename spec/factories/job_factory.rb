FactoryGirl.define do
  factory :job do
    business_name "G00gle"
    title "Software Engineer"
    address { FactoryGirl.build(:address) }
    monthly_income 1000
    duration { FactoryGirl.build(:duration) }
    supervisor { FactoryGirl.build(:reference) }
    less_than_a_year false
  end  
end
