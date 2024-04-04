require 'rails_helper'

RSpec.describe 'Service Facade' do
 describe 'Instance methods' do
  describe 'markets' do
    it 'returns a hash of market data' do
      market_data = ServiceFacade.new.markets
      expect(market_data).to be_a(Hash)
      expect(market_data).to have_key(:name)
      expect(market_data).to have_key(:state)
      expect(market_data).to have_key(:city)
    end
  end
 end
end