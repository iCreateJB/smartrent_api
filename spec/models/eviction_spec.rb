require 'spec_helper'

describe Eviction do 
  it { Eviction.properties.include?(:search_id).should be_true }
  it { Eviction.properties.include?(:action_type).should be_true  }
  it { Eviction.properties.include?(:subject_street).should be_true }
  it { Eviction.properties.include?(:subject_city).should be_true }
  it { Eviction.properties.include?(:subject_state).should be_true }
  it { Eviction.properties.include?(:subject_zip).should be_true }
  it { Eviction.properties.include?(:subject_alias).should be_true }
  it { Eviction.properties.include?(:subject_ssn).should be_true }
  it { Eviction.properties.include?(:subject_dob).should be_true }
  it { Eviction.properties.include?(:case_number).should be_true }
  it { Eviction.properties.include?(:component_description).should be_true }
  it { Eviction.properties.include?(:filing_date).should be_true }
  it { Eviction.properties.include?(:filing_type).should be_true }
  it { Eviction.properties.include?(:plaintiff_full_name).should be_true }
  it { Eviction.properties.include?(:in_dispute).should be_true }
  it { Eviction.properties.include?(:judgment_date).should be_true }
end
