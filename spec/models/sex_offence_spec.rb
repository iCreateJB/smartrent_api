require 'spec_helper'

describe SexOffence do 
  it { SexOffence.properties.include?(:search_id).should be_true }
  it { SexOffence.properties.include?(:first_name).should be_true }
  it { SexOffence.properties.include?(:last_name).should be_true }
  it { SexOffence.properties.include?(:native_record_number).should be_true }
  it { SexOffence.properties.include?(:component_id).should be_true }
  it { SexOffence.properties.include?(:category).should be_true }
  it { SexOffence.properties.include?(:status).should be_true }
  it { SexOffence.properties.include?(:created).should be_true }
end