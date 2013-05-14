require 'spec_helper'

describe RentalAddress do 
  it { RentalAddress.properties.include?(:street).should be_true }
  it { RentalAddress.properties.include?(:city).should be_true }
  it { RentalAddress.properties.include?(:state).should be_true }
  it { RentalAddress.properties.include?(:zip).should be_true }
end