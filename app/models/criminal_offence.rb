class CriminalOffence
  include Ripple::EmbeddedDocument

  property :description, String
  property :search_type, String

  one :subject, :class_name => 'Person'
  many :court_charges, :class_name => 'CourtCharge'
  
end