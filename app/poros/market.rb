class Market
  attr_reader :name,
              :state,
              :city
  
  def initialize(data)
    @name = data[:name]
    @state = data[:state]
    @city = data[:city]
  end
end