class EnrollmentServicesPresenter
  
  attr_accessor :options, :count

  def self.response
    self.new(options).response
  end

  def initialize(options={})
    @options = options
    @count   = 0
  end

  def response
    {
      :count       => @options.size, 
      :enrollments => [
        @options.each do |i|
          {
            :email      => i.email, 
            :first_name => i.first_name,
            :last_name  => i.last_name,
            :renting_in_state_code    => i.renting_in_state_code,
            :sent_rental_applications => i.sent_applications.size
          }
        end
      ]
    }.to_json
  end
end