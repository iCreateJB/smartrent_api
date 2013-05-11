require 'spec_helper'

describe CriminalOffence do 
  it { CriminalOffence.properties.include?(:description).should be_true }
  it { CriminalOffence.properties.include?(:search_type).should be_true }

  it { CriminalOffence.associations.include?(:subject).should be_true }
  it { CriminalOffence.associations.include?(:court_charges).should be_true }
end