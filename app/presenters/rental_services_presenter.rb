class RentalServicesPresenter 

  attr_accessor :options

  def self.response(options={})
    self.new(options).response
  end

  def initialize(options={})
    @options = options
  end

  def response
    {
      :email  => @options[:renter].email,
      :first_name   => @options[:renter].first_name,
      :last_name    => @options[:renter].last_name,
      :renting_in_state_code => @options[:renter].renting_in_state_code,
      :sent_rental_applications => @options[:applications].size,
      :confirmed_at             => @options[:renter].confirmed_at.strftime('%Y-%m-%d'),
      :applications             => @options[:applications]
    }
  end
end