class Occupant
  include Ripple::EmbeddedDocument

  property :first_name, String, :presence => true
  property :last_name, String, :presence => true
  property :relationship, String, :presence => true
  property :smoker, Boolean, :default => nil
  property :birthday, Date, :presence => true

end
