class RentalAddress
  include Ripple::EmbeddedDocument
  include ActionView::Helpers::NumberHelper

  property :street, String
  property :city, String
  property :state, String

end

