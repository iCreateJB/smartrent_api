class CourtCharge
  include Ripple::EmbeddedDocument

  property :description, String
  property :degree, String
  property :enhancing_factor, String
  property :severity, String
  property :disposition, String
  property :disposition_other, String
  property :disposition_date, Date     		
  property :verdict_date, String
  property :verdict_issuing_judge_indicator, String
  property :statute_code_id, String
  property :status_date, Date
  property :filing_date, Date
  
end