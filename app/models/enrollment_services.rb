class EnrollmentServices

  attr_accessor :options, :start_date, :end_date

  def self.by_date(options={})
    self.new(options).enrollments_by_date
  end

  def initialize(options={})
    @options    = options
    @start_date = options[:start_date]
    @end_date   = options[:end_date]
  end

  def enrollments_by_date
    if @options[:type] == 'renter'
      Renter.enrolled_by_date(options)
    else
      Landlord.enrolled_by_date(options)
    end
  end

end