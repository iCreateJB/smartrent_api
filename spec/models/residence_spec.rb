require 'spec_helper'

describe Residence do 
  it { Residence.properties.include?(:rent).should be_true }
  it { Residence.properties.include?(:reason_for_leaving).should be_true }

  it { Residence.associations.include?(:address).should be_true }
  it { Residence.associations.include?(:duration).should be_true }
  it { Residence.associations.include?(:landlord).should be_true }
end