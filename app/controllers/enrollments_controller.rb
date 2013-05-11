class EnrollmentsController < ApplicationController
  respond_to :json
  
  def show
    @enrollments = EnrollmentServices.by_date(params)
    respond_with EnrollmentServicesPresenter.response(@enrollments)
  end
end
