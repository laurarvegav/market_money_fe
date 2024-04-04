require 'rails_helper'

RSpec.describe 'Market' do
 describe 'Initialize' do
  before(:each) do
    @data = {name: "14&U Farmers' Market", street: "1400 U Street NW",
    city: "Washington",
    state: "District of Columbia",
    zip: "20009", id: "322458"}
    @market = Market.new(@data)
  end

  it 'creates markets populating attributes correctly' do

    expect(@market).to be_a(Market)
    expect(@market.name).to eq("14&U Farmers' Market")
    expect(@market.street).to eq("1400 U Street NW")
    expect(@market.city).to eq("Washington")
    expect(@market.state).to eq("District of Columbia")
    expect(@market.zip).to eq("20009")
    expect(@market.id).to eq(322458)
  end

  it 'returns a readable address' do
    expect(@market.address).to eq("1400 U Street NW Washington, District of Columbia 20009")
  end
 end
end