require 'rails_helper'

RSpec.describe 'Vendors Show Page', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    id = 55823
    @vendor_1 = ServiceFacade.new.vendor(id)
  end

  # User Story 3 - Vendors Show Page
  it 'renders markets information and a list of vendors as links to the vendor show page' do  
    # When I visit a vendor's show page 'vendors/:id'
    visit vendor_path(@vendor_1.id)
    # I see that vendor's name, contact information, whether they accept credit, and a description of what they sell
    expect(page).to have_content(@vendor_1.name)
    within ".contact" do
      expect(page).to have_content("Contact Info:")
      expect(page).to have_content("Name: #{@vendor_1.contact_name}")
      expect(page).to have_content("Phone: #{@vendor_1.contact_phone}")
    end

    expect(page).to have_content("Credit Accepted?: NO")
    expect(page).to have_content("Description: ")
  end
 end
end