require 'spec_helper'

describe CreditReportEmployment do 
  it { CreditReportEmployment.properties.include?(:employer_name).should be_true }
  it { CreditReportEmployment.properties.include?(:date_verified).should be_true }
  it { CreditReportEmployment.properties.include?(:date_employed).should be_true }
end