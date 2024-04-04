class Vendor
  attr_reader :id,
              :name,
              :contact_name,
              :contact_phone,
              :credit_accepted,
              :description

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @contact_name = data[:contact_name]
    @contact_phone = data[:contact_phone]
    @credit_accepted = data[:credit_accepted]
    @description = data[:description]
  end

  def credit
    if @credit_accepted == true
      "YES"
    elsif @credit_accepted == false
      "NO"
    end
  end
end