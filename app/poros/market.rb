class Market
  attr_reader :id,
              :name,
              :state,
              :city
  
  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @state = data[:state]
    @city = data[:city]
  end
end