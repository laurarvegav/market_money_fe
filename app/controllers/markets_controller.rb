class MarketsController < ApplicationController
  def index
    @markets = ServiceFacade.new.markets
  end

  def show
    @market = ServiceFacade.new.market(params[:id])
  end
end