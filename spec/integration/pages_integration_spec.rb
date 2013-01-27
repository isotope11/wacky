require 'spec_helper'
require 'integration_helper'

class PagesIntegrationSpec < AcceptanceSpec
  describe "viewing the index page" do
    it "can be viewed" do
      Page.create(slug: 'index', body: 'Hoo **boy** [link](/link)')
      visit "/"
      page.must have_text "Hoo boy link"
      page.must have_xpath "/html/body/p/strong"
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

  describe "working with an existing page" do
    before do
      @page = Page.create(slug: 'foo', body: "## Bar Page\nbar")
    end

    describe "editing" do
      it "updates the page when you edit it" do
        visit '/foo'
        click_link 'Edit'
        fill_in 'Body', with: 'baz'
        click_button 'Update'
        visit '/foo'
        page.must have_text 'baz'
      end
    end

    describe "the title" do
      it "sets the title to the extracted title (first heading)" do
        visit '/foo'
        page_title.must_equal("Bar Page")
      end
    end

    describe "versions" do
      it "lists versions of a page and reverts successfully" do
        @page.update_attributes(body: 'new_content')
        visit '/foo'
        click_link 'Versions'
        page.must have_text "Versions of #{@page.slug}"
        within('table.versions') do
          page.must have_text '1'
          page.must have_text '2'
          click_link '1'
        end
        page.must have_text 'bar'
        click_button "Revert to this version"
        visit '/foo'
        page.must_have_text 'bar'
      end
    end
  end
end
