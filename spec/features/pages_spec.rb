require 'rails_helper'

describe 'navigate' do
  describe 'home page' do
    before do
      visit root_path
    end

    it 'can be reached' do
      expect(page.status_code).to eq(200)
    end

    it "has the correct header" do
      expect(find('h1')).to have_content("Home Page")
    end

    it "has a link to about page" do
      expect(page).to have_link('about')
    end

    it 'will redirect to about page when clicked' do
      click_link('about')
      expect(find('h1')).to have_content("About Me")
    end
  end

  describe 'about page' do
    #'can be visited' tested above
    #'has correct header' tested above
    before do 
      visit about_path
    end

    it 'is displaying the correct content' do
      expect(page).to have_content(/this is my about page, all about me/)
    end

    it 'has the correct image and is displaying' do
      expect(page.find('#about-image')['src']).to have_content '/assets/about.jpg'
      visit page.find('#about-image')['src']
      expect(page.status_code).to eq(200) 
    end

    it 'has a link back to home that works' do
      expect(page).to have_link('back to home')
      click_link('back to home')
      expect(find('h1')).to have_content("Home Page")
    end

  end
end