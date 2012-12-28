require 'spec_helper'

describe Page do
  it "requires a slug" do
    page = Page.new

    page.must have_valid(:slug).when('foo')
    page.wont have_valid(:slug).when(nil)
    page.wont have_valid(:slug).when('')
  end
end
