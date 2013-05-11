require 'spec_helper'

describe Person do 
  it { Person.properties.include?(:prefix_name).should be_true }
  it { Person.properties.include?(:suffix_name).should be_true }
  it { Person.properties.include?(:full_name).should be_true }
  it { Person.properties.include?(:given_name).should be_true }
  it { Person.properties.include?(:maiden_name).should be_true }
  it { Person.properties.include?(:middle_name).should be_true }
  it { Person.properties.include?(:sur_name).should be_true }
end