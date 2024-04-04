require 'rails_helper'

RSpec.describe 'Service Facade' do
 describe 'Instance methods' do
  describe 'markets' do
    it 'returns an array of market data' do
      markets = ServiceFacade.new.markets
      expect(markets).to be_an(Array)
      markets.each do |market|
        expect(market.id).to be_an(Integer)
        expect(market.name).to be_a(String)
        expect(market.city).to be_a(String)
        expect(market.state).to be_a(String)
      end
    end
  end
 end
end