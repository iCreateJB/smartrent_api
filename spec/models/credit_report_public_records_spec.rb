require 'spec_helper'

describe CreditReportPublicRecords do 
  it { CreditReportPublicRecords.properties.include?(:plaintiff).should be_true }
  it { CreditReportPublicRecords.properties.include?(:balance).should be_true }
  it { CreditReportPublicRecords.properties.include?(:recorded).should be_true }
  it { CreditReportPublicRecords.properties.include?(:filed).should be_true }
  it { CreditReportPublicRecords.properties.include?(:reference).should be_true }
  it { CreditReportPublicRecords.properties.include?(:type).should be_true }
  it { CreditReportPublicRecords.properties.include?(:record_type).should be_true }

  it { CreditReportPublicRecords.associations.include?(:credit_report).should be_true }
end