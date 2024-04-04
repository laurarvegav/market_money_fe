class ServiceFacade
  
  def markets
    service = MarketService.new

    json = service.find_markets
    json[:data].map do |market_data|
      data = market_data(market_data)

      Market.new(data)
    end
  end

  def market(id)
    service = MarketService.new

    json = service.find_market(id)
    data = market_data(json[:data])

    Market.new(data)
  end

  def market_data(market_data)
    data = {
      id: market_data[:id],
      name: market_data[:attributes][:name],
      state: market_data[:attributes][:state],
      city: market_data[:attributes][:city],
      street: market_data[:attributes][:street],
      zip: market_data[:attributes][:zip]
    }
  end
end