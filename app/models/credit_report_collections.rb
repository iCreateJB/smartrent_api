class CreditReportCollections
  include Ripple::EmbeddedDocument
  
  property :creditor, String
  property :balance, Float
  property :verified, Time
  property :status, String
  property :remark, String

  one :credit_report, :class_name => 'CreditReport'  
end
