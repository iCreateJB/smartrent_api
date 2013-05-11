class Eviction
  include Ripple::EmbeddedDocument
  
  property :search_id,    Integer,  :presence => true
  property :action_type, String
  property :subject_street, String #Additional Address Information
  property :subject_city, String	 #Additional Address Information
  property :subject_state, String
  property :subject_zip, String
  property :subject_alias, String
  property :subject_ssn, String
  property :subject_dob, Date
  property :case_number, String
  property :component_description, String
  property :filing_date, Date	#Filing date
  property :filing_type, String	#Type of eviction
  property :plaintiff_full_name, String  # FullName	Landlord / Property Management company,  Plaintiff or Law Firm or Attorney Name, attorney name when law firm not available.
  property :in_dispute, String #	Currently in dispute
  property :judgment_date,	Date # Date of Judgment

end
