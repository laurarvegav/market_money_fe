require 'rails_helper'

RSpec.describe 'MarketService' do
 describe 'Instance Methods' do
  it 'gets URL, populating API records into JSON' do
    uri = "markets"
    parsed_markets = MarketService.new.get_url(uri)

    expect(parsed_markets[:data].first).to be_a(Hash)
    expect(parsed_markets[:data].first[:attributes][:name]).to be_a(String)
    expect(parsed_markets[:data].first[:attributes][:city]).to be_a(String)
    expect(parsed_markets[:data].first[:attributes][:state]).to be_a(String)
  end

  it 'finds all of the markets' do
    parsed_markets = MarketService.new.find_markets

    expect(parsed_markets[:data].first).to be_a(Hash)
    expect(parsed_markets[:data].first[:attributes][:name]).to be_a(String)
    expect(parsed_markets[:data].first[:attributes][:city]).to be_a(String)
    expect(parsed_markets[:data].first[:attributes][:state]).to be_a(String)
  end
 end
end