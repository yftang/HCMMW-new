require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'HCMMW'" do
      visit '/static_pages/home'
      page.should have_content('HCMMW')
    end
  end
end
