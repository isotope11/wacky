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
  end
end
