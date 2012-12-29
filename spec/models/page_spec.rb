require 'spec_helper'

describe Page do
  it "requires a slug" do
    page = Page.new

    page.must have_valid(:slug).when('foo')
    page.wont have_valid(:slug).when(nil)
    page.wont have_valid(:slug).when('')
  end

  it "outputs to html" do
    page = Page.new body: "foo [[link]]"
    page.to_html.must_equal "<p>foo <a href='/link'>link</a></p>\n"
  end
end
