require 'spec_helper'

class SpecialPagesIntegrationSpec < AcceptanceSpec
  describe "viewing the recently_updated page" do
    it "can be viewed" do
      # skip
      page = Page.create(slug: 'index', body: 'Hoo **boy** [link](/link)')
      visit "/recently_updated"
      page.slug.must have_text "index"
    end
  end
end
