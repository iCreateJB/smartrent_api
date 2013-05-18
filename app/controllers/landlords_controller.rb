class LandlordsController < ApplicationController

  def show
    @landlord = LandlordServices.summarize(params)
    respond_with LandlordServicesPresenter.response(@landlord)
  end
end
