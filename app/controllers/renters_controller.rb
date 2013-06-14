class RentersController < ApplicationController
  respond_to :json
  
  def show
    if valid_renter?
      @renter = RentalServices.summarize(params)
      respond_with RentalServicesPresenter.response(@renter)      
    else
      response  = { :error => "Renter does not exist." }
      respond_with response
    end
  end

private
  def valid_renter?
    !Renter.find_with_conditions(:email => params[:email].downcase.to_s).blank?
  end
end
