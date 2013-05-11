class CreditReportEmployment
   include Ripple::EmbeddedDocument
   
   property :employer_name, String
   property :date_verified, Date
   property :date_employed, Date
end
