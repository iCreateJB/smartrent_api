class LandlordsController < ApplicationController
  respond_to :json

  def show
    if valid_landlord?
      @landlord = LandlordServices.summarize(params)
      respond_with LandlordServicesPresenter.response(@landlord)
    else
      response  = { :error => "Renter does not exist." }
      respond_with response
    end    
  end

private
  def valid_landlord?
    !Landlord.find_with_conditions(:email => params[:email].downcase.to_s).blank?
  end  
end
