class ServiceFacade
  
  def markets
    service = MarketService.new

    json = service.find_markets
    json[:data].map do |market_data|
      data = {
        id: market_data[:id],
        name: market_data[:attributes][:name],
        state: market_data[:attributes][:state],
        city: market_data[:attributes][:city]
      }

      Market.new(data)
    end
  end
end