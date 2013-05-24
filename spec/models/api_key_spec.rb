require 'spec_helper'

describe ApiKey do 
  it { ApiKey.properties.include?(:access_token).should be_true }
  it { ApiKey.properties.include?(:created_at).should be_true }
  it { ApiKey.properties.include?(:updated_at).should be_true }
end