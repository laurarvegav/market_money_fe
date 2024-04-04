require 'rails_helper'

RSpec.describe 'Market' do
 describe 'Initialize' do
  before(:each) do
    @data = {name: "14&U Farmers' Market", state: "District of Columbia", city: "Washington", id: "322458"}
  end

  it 'creates markets populating attributes correctly' do
    market = Market.new(@data)

    expect(market).to be_a(Market)
    expect(market.name).to eq("14&U Farmers' Market")
    expect(market.state).to eq("District of Columbia")
    expect(market.city).to eq("Washington")
    expect(market.id).to eq(322458)
  end
 end
end