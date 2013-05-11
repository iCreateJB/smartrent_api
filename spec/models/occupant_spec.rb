require 'spec_helper'

describe Occupant do 
  it { Occupant.properties.include?(:first_name).should be_true }
  it { Occupant.properties.include?(:last_name).should be_true }
  it { Occupant.properties.include?(:relationship).should be_true }
  it { Occupant.properties.include?(:smoker).should be_true }
  it { Occupant.properties.include?(:birthday).should be_true }
end