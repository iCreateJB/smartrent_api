require 'spec_helper'

describe Pet do 
  it { Pet.properties.include?(:name).should be_true }
  it { Pet.properties.include?(:weight).should be_true }
  it { Pet.properties.include?(:kind).should be_true }
  it { Pet.properties.include?(:breed).should be_true }
end