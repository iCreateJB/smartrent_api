require 'spec_helper'

describe CourtCharge do 
  it { CourtCharge.properties.include?(:description).should be_true }
  it { CourtCharge.properties.include?(:degree).should be_true }
  it { CourtCharge.properties.include?(:enhancing_factor).should be_true }
  it { CourtCharge.properties.include?(:severity).should be_true }
  it { CourtCharge.properties.include?(:disposition).should be_true }
  it { CourtCharge.properties.include?(:disposition_other).should be_true }
  it { CourtCharge.properties.include?(:disposition_date).should be_true }
  it { CourtCharge.properties.include?(:verdict_date).should be_true }
  it { CourtCharge.properties.include?(:verdict_issuing_judge_indicator).should be_true }
  it { CourtCharge.properties.include?(:statute_code_id).should be_true }
  it { CourtCharge.properties.include?(:status_date).should be_true }
  it { CourtCharge.properties.include?(:filing_date).should be_true }
end