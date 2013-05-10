require 'spec_helper'

describe Address do 
  it { Address.properties.include?(:street).should be_true }
  it { Address.properties.include?(:city).should be_true }
  it { Address.properties.include?(:state).should be_true }
  it { Address.properties.include?(:zip).should be_true }
  it { Address.properties.include?(:unit).should be_true }
  it { Address.properties.include?(:landlord_name).should be_true }
  it { Address.properties.include?(:landlord_phone).should be_true }
  it { Address.properties.include?(:landlord_email).should be_true }
  it { Address.properties.include?(:move_in_date).should be_true }
  it { Address.properties.include?(:move_out_date).should be_true }
  it { Address.properties.include?(:reason_for_leaving).should be_true }
end