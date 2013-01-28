require 'spec_helper'

class SpecialPagesIntegrationSpec < AcceptanceSpec
  describe "viewing the recently_updated page" do
    it "can be viewed" do
      # skip
      Page.create(slug: 'updated-page', body: 'Hoo **boy** [link](/link)')
      visit "/recently_updated"
      page.must have_text "Updated Page"
    end
  end

  describe "viewing all_pages" do
    it "can be viewed" do
      Page.create(slug: 'all-pages', body: 'Hoo **boy** [link](/link)')
      visit "/all_pages"
      page.must have_text "All Pages"
    end
  end
end
