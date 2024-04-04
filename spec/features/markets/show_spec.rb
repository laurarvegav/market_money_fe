require 'rails_helper'

RSpec.describe 'Markets Show Page', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @markets = ServiceFacade.new.markets
    @market_1 = @markets.first
  end

  # User Story 2 - Markets Show Page
  it 'renders markets information and a list of vendors as links to the vendor show page' do  
    # When I visit a market's show page 'markets/:id'
    visit market_path(@market_1.id)
    # I see that market's name and readable address
    expect(page).to have_content(@market_1.name)
    within ".address" do
      expect(page).to have_content("1400 U Street NW Washington, District of Columbia 20009")
    end
    # And I also see a list of all the Vendors that are at that market
    within ".vendors" do
      @market_1.vendors.each do |vendor|
        # Each vendor name is a link to that vendor's show page
        within "#vendor-#{vendor.id}" do
          expect(page).to have_link(vendor.name, href: vendor_path(vendor.id))
        end
      end
    end
  end
 end
end