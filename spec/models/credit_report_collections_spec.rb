require 'spec_helper'

describe CreditReportCollections do 
  it { CreditReportCollections.properties.include?(:creditor).should be_true }
  it { CreditReportCollections.properties.include?(:balance).should be_true }
  it { CreditReportCollections.properties.include?(:verified).should be_true }
  it { CreditReportCollections.properties.include?(:status).should be_true }
  it { CreditReportCollections.properties.include?(:remark).should be_true }

  it { CreditReportCollections.associations.include?(:credit_report).should be_true }
end