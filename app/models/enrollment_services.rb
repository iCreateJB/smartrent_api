class EnrollmentServices

  attr_accessor :options, :start_date, :end_date, :errors, :enrollments

  def self.by_date(options={})
    self.new(options).enrollments_by_date 
  end

  def initialize(options={})
    @options    = options
    @start_date = options[:start_date]
    @end_date   = options[:end_date]
    @errors     = []
  end

  def enrollments_by_date
    @enrollments = @options[:type].downcase.classify.constantize.enrolled_by_date(options) if valid?
    self
  end

  def valid?
    validate_start_date
    validate_end_date
    @errors.empty?
  end

private 

  def validate_start_date
    if @start_date
      begin
        Time.parse(@start_date)
      rescue
        errors << { :start_date => 'Must be a valid date'}
      end
    end
  end

  def validate_end_date
    if @end_date
      begin
        Time.parse(@end_date)
      rescue
        errors << { :end_date => 'Must be a valid date'}
      end
    end
  end

end