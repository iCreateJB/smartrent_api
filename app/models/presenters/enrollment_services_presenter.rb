class EnrollmentServicesPresenter
  
  attr_accessor :options, :count

  def self.response
    self.new(options).response
  end

  def initialize(options={})
    @options = options
    @enrollments = []
    @count   = 0
  end

  def renters 
    @options.each do |i|
      @enrollments.push << {
        :email      => i.email, 
        :first_name => i.first_name,
        :last_name  => i.last_name,
        :renting_in_state_code    => i.renting_in_state_code,
        :sent_rental_applications => i.sent_rental_applications.size
      }
    end
    @enrollments
  end

  def response
    {
      :count       => @options.size, 
      :enrollments => renters
    }.to_json
  end
end