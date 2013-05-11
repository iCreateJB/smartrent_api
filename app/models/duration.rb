class Duration
  include Ripple::EmbeddedDocument

  property :start_date, Date, :presence => true
  property :end_date, Date
end
