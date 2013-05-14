class RentalServices

  attr_accessor :options, :renter, :sent_applications

  def self.summarize(options={})
    self.new(options).summary
  end

  def initialize(options={})
    @options = options
    @renter  = Renter.find_with_conditions(:email => options[:renter]).first
    @sent_applications = []
  end

  def sent_applications
    @renter.sent_rental_applications.each do |i|
      @sent_applications.push << {
        :landlord  => i.landlord.email,
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
      :renter       => @renter,
      :applications => sent_applications
    }
  end
end