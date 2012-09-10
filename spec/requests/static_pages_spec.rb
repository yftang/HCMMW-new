require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the h1 'HCMMW'" do
      visit '/static_pages/home'
      page.should have_selector( 'h1',
                                :text => 'HCMMW')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                :text => "Home | HCMMW")
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector( 'h1',
                                :text => 'Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                                :text => "Help | HCMMW")
    end
  end

  describe "Home page" do
    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector( 'h1',
                                :text => 'About')
    end

    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                                :text => "About Us | HCMMW")
    end
  end
end
