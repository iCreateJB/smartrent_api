require 'spec_helper'

describe Job do 
  it { Job.properties.include?(:business_name).should be_true }
  it { Job.properties.include?(:title).should be_true }
  it { Job.properties.include?(:monthly_income).should be_true }
  it { Job.properties.include?(:less_than_a_year).should be_true }
  it { Job.properties.include?(:current_position).should be_true }

  it { Job.associations.include?(:address).should be_true }
  it { Job.associations.include?(:duration).should be_true }
  it { Job.associations.include?(:supervisor).should be_true }
  
end
