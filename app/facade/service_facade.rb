class ServiceFacade
  
  def markets
    service = MarketService.new

    json = service.find_markets
    json[:data].map do |json_data|
      data = market_data(json_data)

      Market.new(data)
    end
  end

  def markets_search(input)
    service = MarketService.new

    json = service.find_market_search(input)
    json[:data].map do |json_data|
      data = market_data(json_data)

      Market.new(data)
    end
  end

  def market(id)
    service = MarketService.new

    json = service.find_market(id)
    data = market_data(json[:data])

    Market.new(data)
  end

  def vendor(id)
    service = MarketService.new

    json = service.find_vendor(id)
    data = {
      id: json[:data][:id],
      name: json[:data][:attributes][:name],
      description: json[:data][:attributes][:description],
      contact_name: json[:data][:attributes][:contact_name],
      contact_phone: json[:data][:attributes][:contact_phone],
      credit_accepted: json[:data][:attributes][:credit_accepted]
    }

    Vendor.new(data)
  end

  def market_data(market_data)
    data = {
      id: market_data[:id],
      name: market_data[:attributes][:name],
      state: market_data[:attributes][:state],
      city: market_data[:attributes][:city],
      street: market_data[:attributes][:street],
      zip: market_data[:attributes][:zip],
      vendors_ids: market_data[:relationships][:vendors][:data].map do |vendor|
        vendor[:id]
      end
    }
  end
end