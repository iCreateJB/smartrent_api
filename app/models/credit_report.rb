class CreditReport
  include Ripple::EmbeddedDocument

  property :search_id,    Integer,  :presence => true
  property :score, Integer
  property :first_name, String
  property :last_name, String
  property :dob, Date
  property :ori_first_name, String
  property :ori_middle_name, String
  property :ori_last_name, String
  property :ori_address, String
  property :ori_city, String
  property :ori_state, String
  property :ori_zip, String
  property :negative_credit_lines, Integer
  property :total_collections, Integer
  property :past_due_30, Integer
  property :past_due_60, Integer
  property :past_due_90, Integer

  one :revolving,       :class_name => "CreditReportSummaryItem"
  one :installment,     :class_name => "CreditReportSummaryItem"
  one :mortgage,        :class_name => "CreditReportSummaryItem"
  one :open,            :class_name => "CreditReportSummaryItem"
  one :closed_with_bal, :class_name => "CreditReportSummaryItem"
  one :total,           :class_name => "CreditReportSummaryItem"

  many :employments, :class_name => 'CreditReportEmployment'
  many :lines_of_credit,  :class_name => 'CreditReportTradeLines'
  many :collections, :class_name => 'CreditReportCollections'
  many :public_records, :class_name => 'CreditReportPublicRecords'
  many :addresses, :class_name => 'Address'

end
