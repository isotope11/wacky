require 'spec_helper'

class PagesIntegrationSpec < AcceptanceSpec
  describe "viewing the index page" do
    it "can be viewed" do
      Page.create(slug: 'index', body: 'Hoo boy')
      visit "/"
      page.must have_text "Hoo boy"
    end
  end

  describe "making a new page" do
    it "asks you to create a page if it doesn't exist" do
      visit "/new-page"
      page.must have_text "Make a new page"
    end

    it "creates a new page when you post" do
      old_page_count = Page.count
      visit "/new-page"
      click_button 'Create'
      Page.count.must_equal old_page_count + 1
    end
  end
end
