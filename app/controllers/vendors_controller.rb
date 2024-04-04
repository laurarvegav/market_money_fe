class VendorsController < ApplicationController
  def show
    @vendor = ServiceFacade.new.vendor(params[:id])
    if search_params.present? && search_input.present?
      @markets = ServiceFacade.new.markets_search(search_input) 
    else
      flash[:error] = "Name or city can not be sent on their own. Please provide other parameters to search for markets"
    end
  end

  private
  def search_params
    (params[:name].present? || params[:city].present? || params[:state].present? ) && (params[:name]!="Name" || params[:city]!="City" || params[:state]!="State")
  end

  def search_input
    if params[:name]!="Name" && params[:city]!="City" && params[:state]!="State"
      "name=#{params[:name]}&state=#{params[:state]}&city=#{params[:city]}"
    elsif params[:name]!="Name" && params[:state]!="State"
      "name=#{params[:name]}&state=#{params[:state]}"
    elsif params[:name]!="Name" && params[:city]!="City"
      "name=#{params[:name]}&city=#{params[:city]}"
    elsif params[:state]!="State" && params[:city]!="City"
      "state=#{params[:state]}&city=#{params[:city]}"
    elsif params[:state]!="State"
      "state=#{params[:state]}"
    else
      nil
    end
  end
end