require 'rails_helper'

RSpec.describe 'Vendors Show Page', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @vendor_1 = ServiceFacade.new.vendor(55823)
    @vendor_2 = ServiceFacade.new.vendor(55824)
    @market_1 = ServiceFacade.new.market(322664)
    @market_2 = ServiceFacade.new.market(322760)
  end

  # User Story 3 - Vendors Show Page
  it 'renders markets information and a list of vendors as links to the vendor show page' do  
    # When I visit a vendor's show page 'vendors/:id'
    visit vendor_path(@vendor_1.id)
    save_and_open_page
    # I see that vendor's name, contact information, whether they accept credit, and a description of what they sell
    expect(page).to have_content(@vendor_1.name)
    within ".contact" do
      expect(page).to have_content("Contact Info:")
      expect(page).to have_content("Name: #{@vendor_1.contact_name}")
      expect(page).to have_content("Phone: #{@vendor_1.contact_phone}")
    end
    expect(page).to have_content("Credit Accepted?: NO")
    expect(page).to have_content("Description: Vendor selling a variety of artisanal cured meats and sausages.")
  end

  #User Story 4 - Vendor Show Page can Search for Markets to Add
  it 'allows users to search for Markets to add this vendor to' do
    # When I visit a vendor's show page 'vendors/:id'
    visit vendor_path(@vendor_1.id)
    # I see a section on the page to search for Markets to add this Vendor
    within ".search_markets" do
      expect(page).to have_content("Search for Markets to add this vendor:")
      # When I fill out the form with a valid combination of parameters (see project requirements to know what parameter combinations are considered valid)
      fill_in(:name, with: "")
      fill_in(:city, with: "")
      fill_in(:state, with: "California")
      # And click the button to search for markets
      click_button('Search')
    end

    within ".found_markets" do
      # I see a list of Market's that match my search terms
      # And each market listed is a link to it's show page
      within "#market-#{@market_1.id}" do
        expect(page).to have_link("Antelope Valley Winery Farmer's Market", href: market_path(@market_1.id))
      end
      within "#market-#{@market_2.id}" do
        expect(page).to have_link("Atascadero Farmers Market", href: market_path(@market_2.id))
      end
    end
    # Note: If an invalid set of parameters are passed in, a flash message should describe the problem that occurred.
  end

  #US4 Sad path
  it 'returns a detailed messaje if an invalid set of parameters are passed in when users search for Markets to add this vendor to' do
    visit vendor_path(@vendor_2.id)
    within ".search_markets" do
      # When I fill out the form with a ivalid combination of parameters 
      fill_in(:city, with: "Denver")
      # And click the button to search for markets
      click_button('Search')
    end
    # When invalid set of parameters are passed in, a flash message should describe the problem that occurred.
    sleep 2
    within "#flash" do
      expect(page).to have_content("Name or city can not be sent on their own. Please provide other parameters to search for markets")
    end

    visit vendor_path(@vendor_2.id)
    within ".search_markets" do 
      fill_in(:name, with: "Cal")
      click_button('Search')
    end
    # When invalid set of parameters are passed in, a flash message should describe the problem that occurred.
    sleep 2
    within "#flash" do
      expect(page).to have_content("Name or city can not be sent on their own. Please provide other parameters to search for markets")
    end
  end
 end
end