class SentRentalApplication < RentalApplication
  property :note,             String
  property :sent_on,          Time,   :default => proc { Time.now }
  property :agreed_on,        Time

  one :rental_address
  one :landlord, :class_name => "Landlord"
  
end
