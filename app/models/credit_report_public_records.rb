class CreditReportPublicRecords
  include Ripple::EmbeddedDocument  
  
  property :plaintiff, String
  property :balance, Float
  property :recorded, Time
  property :filed, Time  
  property :reference, String
  property :type, String
  property :record_type, String

  one :credit_report, :class_name => 'CreditReport'
end
