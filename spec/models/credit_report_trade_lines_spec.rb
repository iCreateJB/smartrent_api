require 'spec_helper'

describe CreditReportTradeLines do 
  it { CreditReportTradeLines.properties.include?(:name).should be_true }
  it { CreditReportTradeLines.properties.include?(:payment).should be_true }
  it { CreditReportTradeLines.properties.include?(:balance).should be_true }
  it { CreditReportTradeLines.properties.include?(:past_due).should be_true }
  it { CreditReportTradeLines.properties.include?(:verified).should be_true }
  it { CreditReportTradeLines.properties.include?(:account_type).should be_true }
  it { CreditReportTradeLines.properties.include?(:loan_type).should be_true }
  it { CreditReportTradeLines.properties.include?(:past_due_30).should be_true }
  it { CreditReportTradeLines.properties.include?(:past_due_60).should be_true }
  it { CreditReportTradeLines.properties.include?(:past_due_90).should be_true }

  it { CreditReportTradeLines.associations.include?(:credit_report).should be_true }
end