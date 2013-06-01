class EnrollmentsController < ApplicationController
  respond_to :json
  
  def show
    @enrollments = EnrollmentServices.by_date(params)
    if @enrollments.valid?
      respond_with EnrollmentServicesPresenter.response(@enrollments.enrollments)
    else
      respond_with @enrollments.errors
    end
  end
end
