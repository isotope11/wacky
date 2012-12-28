require 'spec_helper'

class PagesIntegrationSpec < AcceptanceSpec
  describe "viewing the index page" do
    it "responds" do
      visit "/"
      page.must have_text "Hi"
    end
  end
end
