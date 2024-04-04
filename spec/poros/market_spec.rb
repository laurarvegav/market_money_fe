require 'rails_helper'

RSpec.describe 'Market' do
 describe 'Initialize' do
  before(:each) do
    @data = {name: "14&U Farmers' Market", state: "District of Columbia", city: "Washington"}
  end

  it 'creates markets populating attributes correctly' do
    market = Market.new(@data)

    expect(market).to be_a(Market)
    expect(market.name).to eq("14&U Farmers' Market")
    expect(market.state).to eq("District of Columbia")
    expect(market.city).to eq("Washington")
  end
 end
end