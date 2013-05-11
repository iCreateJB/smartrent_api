require 'spec_helper'

describe CreditReportSummaryItem do 
  it { CreditReportSummaryItem.properties.include?(:count).should be_true }
  it { CreditReportSummaryItem.properties.include?(:high_credit).should be_true }
  it { CreditReportSummaryItem.properties.include?(:credit_limit).should be_true }
  it { CreditReportSummaryItem.properties.include?(:balance).should be_true }
  it { CreditReportSummaryItem.properties.include?(:monthly_payment).should be_true }
  it { CreditReportSummaryItem.properties.include?(:percent_credit_avail).should be_true }
  it { CreditReportSummaryItem.properties.include?(:past_due).should be_true}
end