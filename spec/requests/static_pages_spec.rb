require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "HCMMW" }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector 'h1',
                              :text => 'HCMMW' }

    it { should have_selector 'title',
                              :text => full_title('Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector 'h1',
                              :text => 'Help' }

    it { should have_selector 'title',
                               :text => full_title('Help') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector 'h1',
                              :text => 'About' }

    it { should have_selector 'title',
                              :text => full_title('About Us') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector 'h1',
                              :text => 'Contact' }

    it { should have_selector 'title',
                              :text => full_title('Contact') }
  end
end