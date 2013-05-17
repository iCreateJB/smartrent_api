class RentersController < ApplicationController
  respond_to :json
  
  def show
    @renter = RentalServices.summarize(params)
    respond_with RentalServicesPresenter.response(@renter)
  end
end
