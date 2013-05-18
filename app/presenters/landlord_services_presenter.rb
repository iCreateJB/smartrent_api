class LandlordServicesPresenter 

  attr_accessor :options

  def self.response(options={})
    self.new(options).response
  end

  def initialize(options={})
    @options = options
  end

  def response
    {
      :email  => @options[:landlord].email,
      :first_name   => @options[:landlord].first_name,
      :last_name    => @options[:landlord].last_name,
      :sent_rental_applications => @options[:applications].size,
      :confirmed_at             => @options[:landlord].confirmed_at.strftime('%Y-%m-%d'),
      :applications             => @options[:applications]
    }
  end
end