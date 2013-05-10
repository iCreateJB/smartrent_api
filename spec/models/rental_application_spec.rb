require 'spec_helper'

describe RentalApplication do 
  it { RentalApplication.properties.include?(:cc_expiration).should be_true }
  it { RentalApplication.properties.include?(:agreed_to_toc).should be_true }
  it { RentalApplication.properties.include?(:multiple_sources_of_income).should be_true }
  it { RentalApplication.properties.include?(:has_a_pet).should be_true }
  it { RentalApplication.properties.include?(:phone).should be_true }
  it { RentalApplication.properties.include?(:expected_move_in_date).should be_true }
  it { RentalApplication.properties.include?(:one_year_or_more).should be_true }
  it { RentalApplication.properties.include?(:current_address_is_billing_address).should be_true }
  it { RentalApplication.properties.include?(:background_check_saved).should be_true }
  it { RentalApplication.properties.include?(:payment_processed_popup).should be_true }
  it { RentalApplication.properties.include?(:paid_on).should be_true }
  it { RentalApplication.properties.include?(:application_ref_number).should be_true }
  it { RentalApplication.properties.include?(:recorded_on).should be_true }
  it { RentalApplication.properties.include?(:other_occupants).should be_true }
  it { RentalApplication.properties.include?(:has_pets).should be_true }
  it { RentalApplication.properties.include?(:additional_occupants).should be_true }
  it { RentalApplication.properties.include?(:additional_pets).should be_true }
  it { RentalApplication.properties.include?(:employment_status).should be_true }
  it { RentalApplication.properties.include?(:additional_income).should be_true }
  it { RentalApplication.properties.include?(:additional_income_source).should be_true }

  it { RentalApplication.associations.include?(:renter).should be_true }
  it { RentalApplication.associations.include?(:credit_report).should be_true }
  it { RentalApplication.associations.include?(:current_address).should be_true }
  it { RentalApplication.associations.include?(:billing_address).should be_true }
  it { RentalApplication.associations.include?(:prior_address).should be_true }
  it { RentalApplication.associations.include?(:current_address).should be_true }
  it { RentalApplication.associations.include?(:previous_job).should be_true }
  it { RentalApplication.associations.include?(:primary).should be_true }
  it { RentalApplication.associations.include?(:pets).should be_true }
  it { RentalApplication.associations.include?(:occupants).should be_true }
  it { RentalApplication.associations.include?(:evictions).should be_true }
  it { RentalApplication.associations.include?(:criminal_offences).should be_true }  

end