require 'spec_helper'

describe CreditReport do 
  it { CreditReport.properties.include?(:search_id).should be_true }
  it { CreditReport.properties.include?(:score).should be_true }
  it { CreditReport.properties.include?(:first_name).should be_true }
  it { CreditReport.properties.include?(:last_name).should be_true }
  it { CreditReport.properties.include?(:dob).should be_true }
  it { CreditReport.properties.include?(:ori_first_name).should be_true }
  it { CreditReport.properties.include?(:ori_middle_name).should be_true }
  it { CreditReport.properties.include?(:ori_last_name).should be_true }
  it { CreditReport.properties.include?(:ori_address).should be_true }
  it { CreditReport.properties.include?(:ori_city).should be_true }
  it { CreditReport.properties.include?(:ori_state).should be_true }
  it { CreditReport.properties.include?(:ori_zip).should be_true }
  it { CreditReport.properties.include?(:negative_credit_lines).should be_true }
  it { CreditReport.properties.include?(:total_collections).should be_true }
  it { CreditReport.properties.include?(:past_due_30).should be_true }
  it { CreditReport.properties.include?(:past_due_60).should be_true }
  it { CreditReport.properties.include?(:past_due_90).should be_true }

  it { CreditReport.associations.include?(:revolving).should be_true }
  it { CreditReport.associations.include?(:installment).should be_true }
  it { CreditReport.associations.include?(:mortgage).should be_true }
  it { CreditReport.associations.include?(:open).should be_true }
  it { CreditReport.associations.include?(:closed_with_bal).should be_true }
  it { CreditReport.associations.include?(:total).should be_true }

  it { CreditReport.associations.include?(:employments).should be_true }
  it { CreditReport.associations.include?(:lines_of_credit).should be_true }
  it { CreditReport.associations.include?(:collections).should be_true }
  it { CreditReport.associations.include?(:public_records).should be_true }
  it { CreditReport.associations.include?(:addresses).should be_true }

end