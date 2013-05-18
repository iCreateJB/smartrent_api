class IndexController < ApplicationController
  respond_to :json

  def show
    respond_with(:status => "OK")
  end
end