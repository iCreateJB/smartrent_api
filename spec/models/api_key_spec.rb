require 'spec_helper'

describe ApiKey do 
  it { ApiKey.properties.include?(:key).should be_true }
  it { ApiKey.properties.include?(:secret).should be_true }
  it { ApiKey.properties.include?(:email).should be_true }
  it { ApiKey.properties.include?(:created_at).should be_true }
  it { ApiKey.properties.include?(:updated_at).should be_true }
end