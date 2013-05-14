FactoryGirl.define do
  factory :rental_application do
    # r.six_moths_or_more true
    multiple_sources_of_income false
    has_a_pet true
    phone "818 123 1234"
    expected_move_in_date { 1.week.from_now }
    primary { FactoryGirl.build(:occupant, :relationship => "applicant" ) }
    current_address { FactoryGirl.build(:address) }
    billing_address { FactoryGirl.build(:address) }
    current_job {FactoryGirl.build(:job) }
    employment_status "employed"
    one_year_or_more true
    other_occupants true
    current_address_is_billing_address false
    has_pets true
    occupants {[FactoryGirl.build(:occupant), FactoryGirl.build(:occupant)]}
    # social_security "897506697"
    pets { [FactoryGirl.build(:pet), FactoryGirl.build(:pet) ]}
  end

  factory :sent_rental_application, :parent => :rental_application, :class => SentRentalApplication do
    note "This is a note"
    sent_on { Time.now}
    rental_address { FactoryGirl.build(:rental_address) }
    renter { FactoryGirl.create(:renter)}
    landlord { FactoryGirl.create(:landlord)}
  end

  factory :empty_rental_application, :class => RentalApplication do
  end

  factory :step_one_rental_application, :parent => :empty_rental_application do
    primary { FactoryGirl.build(:occupant, :relationship => "applicant", :smoker => nil ) }
    current_address { FactoryGirl.build(:address) }
    billing_address { FactoryGirl.build(:address) }
    current_address_is_billing_address false
    one_year_or_more false
    prior_address { FactoryGirl.build(:address, :move_in_date => 1.year.ago)}
    background_check_saved true
  end

  factory :step_landlord_rental_application, :parent => :step_one_rental_application do
    phone "818 123 1234"
    expected_move_in_date { 1.week.from_now }
    current_address { FactoryGirl.build(:address_with_landlord)}
    prior_address { FactoryGirl.build(:address_with_landlord, :move_in_date => 1.year.ago) }
  end

  factory :step_employment_rental_application, :parent => :step_landlord_rental_application do
    current_job {FactoryGirl.build(:job) }
    employment_status "employed"
  end

  factory :step_one_rental_application_with_twelve_months, :parent => :step_one_rental_application do
    one_year_or_more true
  end

  factory :occupant_step_rental_application_with_no_occupants, :parent => :step_employment_rental_application do
    other_occupants false
    primary { FactoryGirl.build(:occupant, :relationship => "applicant", :smoker => false ) }
    has_pets true
    pets { [FactoryGirl.build(:pet), FactoryGirl.build(:pet) ] }
  end

  factory :occupant_step_rental_application_with_no_pets, :parent => :step_employment_rental_application do
    other_occupants true
    primary { FactoryGirl.build(:occupant, :relationship => "applicant", :smoker => false ) }
    occupants {[FactoryGirl.build(:occupant), FactoryGirl.build(:occupant)]}
    has_pets false
  end

  factory :occupant_step_rental_application, :parent => :step_employment_rental_application do
    other_occupants true
    additional_occupants false
    additional_pets false
    primary { FactoryGirl.build(:occupant, :relationship => "applicant", :smoker => false ) }
    occupants {[FactoryGirl.build(:occupant), FactoryGirl.build(:occupant)]}
    has_pets true
    pets { [FactoryGirl.build(:pet), FactoryGirl.build(:pet) ] }
  end
end
