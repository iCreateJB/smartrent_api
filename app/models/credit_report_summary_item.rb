class CreditReportSummaryItem
   include Ripple::EmbeddedDocument
   
   property :count, Integer
   property :high_credit, Float
   property :credit_limit, Float
   property :balance, Float
   property :monthly_payment, Float
   property :percent_credit_avail, Float
   property :past_due, Float
   
end
