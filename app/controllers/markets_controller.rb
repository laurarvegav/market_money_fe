class MarketsController < ApplicationController
  def index
    @markets = ServiceFacade.new.markets
  end

  def show

  end
end