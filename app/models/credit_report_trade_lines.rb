class CreditReportTradeLines
  include Ripple::EmbeddedDocument
  
  property :name, String
  property :payment, Float
  property :balance, Float
  property :past_due, Float
  property :verified, Time
  property :account_type, String
  property :loan_type, String
  property :past_due_30, Integer
  property :past_due_60, Integer
  property :past_due_90, Integer

  one :credit_report, :class_name => 'CreditReport'    
end
