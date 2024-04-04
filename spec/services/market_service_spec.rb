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

  it 'finds a market given its id' do
    id = 322458
    parsed_market = MarketService.new.find_market(id)

    expect(parsed_market[:data]).to be_a(Hash)
    expect(parsed_market[:data][:attributes][:name]).to be_a(String)
    expect(parsed_market[:data][:attributes][:city]).to be_a(String)
    expect(parsed_market[:data][:attributes][:state]).to be_a(String)
    expect(parsed_market[:data][:id]).to be_a(String)
    expect(parsed_market[:data][:relationships][:vendors][:data].first[:id]).to be_a(String)
  end

  it 'finds a vendor given its id' do
    id = 55823
    parsed_vendor = MarketService.new.find_vendor(id)

    expect(parsed_vendor[:data]).to be_a(Hash)
    expect(parsed_vendor[:data][:attributes][:name]).to be_a(String)
    expect(parsed_vendor[:data][:attributes][:description]).to be_a(String)
    expect(parsed_vendor[:data][:attributes][:contact_name]).to be_a(String)
    expect(parsed_vendor[:data][:attributes][:contact_phone]).to be_a(String)
    expect(parsed_vendor[:data][:attributes][:credit_accepted]).to be_in([true, false])
    expect(parsed_vendor[:data][:id]).to be_a(String)
  end
 end
end