class LandlordsController < ApplicationController
  respond_to :json

  def show
    @landlord = LandlordServices.summarize(params)
    respond_with LandlordServicesPresenter.response(@landlord)
  end
end
