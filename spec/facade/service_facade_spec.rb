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
          expect(market.address).to be_a(String)
        end
      end

      it 'returns a market when given its id' do
        id = 322458
        market = ServiceFacade.new.market(id)
        expect(market).to be_a(Market)
      end

      it 'returns a vendor when given its id' do
        id = 55823
        vendor = ServiceFacade.new.vendor(id)
        expect(vendor).to be_a(Vendor)
      end

      it 'markets_search returns an array of market data given a keyword' do
        markets = ServiceFacade.new.markets_search("city=Denver&state=Colorado")
        expect(markets).to be_an(Array)
        markets.each do |market|
          expect(market).to be_a(Market)
        end
      end
    end
  end

  describe 'helper methods' do
    describe 'market_data' do
      it "returns a hash of market data" do
        data = 
        {:id=>"322458",
          :type=>"market",
          :attributes=>
            {:name=>"14&U Farmers' Market",
            :street=>"1400 U Street NW ",
            :city=>"Washington",
            :county=>"District of Columbia",
            :state=>"District of Columbia",
            :zip=>"20009",
            :lat=>"38.9169984",
            :lon=>"-77.0320505",
            :vendor_count=>1},
          :relationships=>{:vendors=>{:data=>[{:id=>"55823", :type=>"vendor"}]}}}

        expect(ServiceFacade.new.market_data(data)).to eq({name: "14&U Farmers' Market", street: "1400 U Street NW ",
        city: "Washington",
        state: "District of Columbia",
        zip: "20009", id: "322458", vendors_ids: ["55823"]})
      end
    end
  end
end