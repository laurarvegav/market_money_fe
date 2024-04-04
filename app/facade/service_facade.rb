class ServiceFacade
  
  def markets
    service = MarketService.new

    json = service.find_markets
    json[:data].map do |market_data|
      Market.new(market_data[:attributes])
    end
  end
end