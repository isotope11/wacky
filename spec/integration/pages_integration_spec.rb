require 'spec_helper'

class PagesIntegrationSpec < AcceptanceSpec
  describe "viewing the index page" do
    it "can be viewed" do
      Page.create(slug: 'index', body: 'Hoo boy [[link]]')
      visit "/"
      page.must have_text "Hoo boy link"
      find_link('link').visible?.must_equal true # Don't know how to do this sensibly :-\
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

  describe "editing a page" do
    it "updates the page when you edit it" do
      Page.create(slug: 'foo', body: 'bar')
      visit '/foo'
      click_link 'Edit'
      fill_in 'Body', with: 'baz'
      click_button 'Update'
      visit '/foo'
      page.must have_text 'baz'
    end
  end
end
