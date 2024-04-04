class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :zip,
              :vendors_id
  
  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @vendors_id = data[:vendors_ids]
  end

  def address
    "#{@street} #{@city}, #{@state} #{@zip}"
  end

  def vendors
    @vendors_id.map do |id|
      ServiceFacade.new.vendor(id)
    end
  end
end