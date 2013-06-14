class LandlordServices

  attr_accessor :options, :landlord, :sent_applications

  def self.summarize(options={})
    self.new(options).summary
  end

  def initialize(options={})
    @options   = options
    @landlord  = Landlord.find_with_conditions(:email => options[:email].downcase.to_s).first
    @sent_applications = []
  end

  def sent_applications
    @landlord.sent_rental_applications.each do |i|
      @sent_applications.push << {
        :renter    => i.renter.email,
        :street    => i.rental_address.street.blank? ? '' : i.rental_address.street,
        :city      => i.rental_address.city.blank? ? '' : i.rental_address.city,
        :postal    => i.rental_address.zip.blank? ? '' : i.rental_address.zip,
        :sent_on   => i.sent_on.strftime('%Y-%m-%d')
      }
    end
    @sent_applications
  end

  def summary
    { 
      :landlord     => @landlord,
      :applications => sent_applications
    }
  end
end