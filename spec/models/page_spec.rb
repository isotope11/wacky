require 'spec_helper'

describe Page do
  it "requires a slug" do
    page = Page.new

    page.must have_valid(:slug).when('foo')
    page.must have_valid(:slug).when('a-b')
    page.wont have_valid(:slug).when(nil)
    page.wont have_valid(:slug).when('')
    page.wont have_valid(:slug).when('a b')
  end

  it "outputs to html" do
    page = Page.new body: "foo [link](/link)"
    page.to_html.must_equal "<p>foo <a href=\"/link\">link</a></p>\n"
  end

  it "is versioned" do
    body_content = "foo [link](/link)"
    slug = 'new-thing'
    page = Page.create body: body_content, slug: slug
    page.versions.count.must_equal 1
    page.body = "new content"
    page.save
    page.versions.count.must_equal 2
    page = page.previous_version
    page.save
    page = Page.find_by_slug slug
    page.body.must_equal body_content
  end
end
