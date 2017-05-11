require 'rails_helper'

RSpec.describe "Urls", type: :request do
	let(:long_url)		{ 'http://www.testing.com' }
	let(:short_url)		{ SecureRandom.base64[0..8] }

  describe "GET /urls", type: :feature do
    it "displays urls" do
    	Url.create!(long_url: long_url, short_url: short_url)
      visit urls_path
      expect(page).to have_content(long_url)
    end
  end

  describe "POST /urls", type: :feature do
  	it "creates a new url object with short url" do
  		visit new_url_path
  		fill_in("url[long_url]", with: long_url)
  		click_button("Shorten URL!")
  		expect(page).to have_content(long_url)
  	end
  end

   describe "GET /urls/url", type: :feature do
  	it "Navigates to show page when long url is clicked" do
  		visit new_url_path
  		fill_in("url[long_url]", with: long_url)
  		click_button("Shorten URL!")
  		click_link(long_url)
  		expect(page).to have_content(long_url)
  	end
  end

end
