class Address
  include Ripple::EmbeddedDocument
  include ActionView::Helpers::NumberHelper

  property :street, String, :presence => true
  property :city, String, :presence => true
  property :state, String, :presence => true
  property :zip, String, :presence => true
  property :unit, String
  property :landlord_name, String
  property :landlord_phone, String
  property :landlord_email, String
  property :move_in_date, Date
  property :move_out_date, Date
  property :monthly_rent, String
  property :reason_for_leaving, String
  property :report_date, Date
  
end
