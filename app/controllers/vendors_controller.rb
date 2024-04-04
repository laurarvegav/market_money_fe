class VendorsController < ApplicationController
  def show
    @vendor = ServiceFacade.new.vendor(params[:id])
  end
end