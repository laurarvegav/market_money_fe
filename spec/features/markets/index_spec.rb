require 'rails_helper'

RSpec.describe 'Markets Index Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do

    end

    #User story 1
    it 'shows all markets listed with their name, city and state, and a button that directs to that market show page' do
      # When I visit '/markets'
      visit markets_path
      # I see all markets listed with their name, city and state
      within "#markets" do
        Market.all.each do |market|
          expect(page).to have_content(market.name)
          expect(page).to have_content(market.city)
          expect(page).to have_content(market.state)
          expect(page).to have_button('More info', href: market_path(market))
        end
      end
      # When I click a button to see more info on that market
      within ".markets" do
        within "#market-#{@market_sf.id}" do
          click_button("More info")
        end
      end
      # I'm taken to that market's show page '/markets/:id'
      expect(current_path).to eq(market_path(@market_sf))
    end
  end
end