require 'spec_helper'

describe Duration do 
  it { Duration.properties.include?(:start_date).should be_true }
  it { Duration.properties.include?(:end_date).should be_true }
end