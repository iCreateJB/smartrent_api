require 'spec_helper'

describe Reference do 
  it { Reference.properties.include?(:name).should be_true }
  it { Reference.properties.include?(:phone).should be_true }
  it { Reference.properties.include?(:email).should be_true }
end