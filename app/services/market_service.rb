class MarketService
  def connection
    Faraday.new(url: "http://localhost:3000/api/v0")
  end

  def get_url(uri)
    response = connection.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_markets
    get_url("markets")
  end

  def find_market(id)
    get_url("markets/#{id}")
  end
  
  def find_vendor(id)
    get_url("vendors/#{id}")
  end
  
  def find_market_search(key_params)
    get_url("markets/search?#{key_params}")
  end
end