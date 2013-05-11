class Reference
  include Ripple::EmbeddedDocument
  include ActionView::Helpers::NumberHelper

  property :name, String, :presence => true
  property :phone, String
  property :email, String

end
