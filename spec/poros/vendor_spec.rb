require 'rails_helper'

RSpec.describe 'Vendor' do
  before(:each) do
    data = {:id=>"55823",
    :name=>"The Charcuterie Corner",
    :description=>"Vendor selling a variety of artisanal cured meats and sausages.",
    :contact_name=>"Claudie Langworth III",
    :contact_phone=>"1-147-179-9747",
    :credit_accepted=>false}

    @vendor = Vendor.new(data)
  end

  describe 'Initialize' do
    it 'creates vendors populating attributes correctly' do
      expect(@vendor).to be_a(Vendor)
      expect(@vendor.name).to eq("The Charcuterie Corner")
      expect(@vendor.description).to eq("Vendor selling a variety of artisanal cured meats and sausages.")
      expect(@vendor.contact_name).to eq("Claudie Langworth III")
      expect(@vendor.contact_phone).to eq("1-147-179-9747")
      expect(@vendor.credit_accepted).to eq(false)
    end
  end

  describe "credit" do
    it "returns the correct value when true or false" do
      expect(@vendor.credit).to eq("NO")
    end
  end
end