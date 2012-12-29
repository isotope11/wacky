module Wacky
  class Page < ActiveRecord::Base
    validates_presence_of :slug

    def to_html
      wiki_parsed = wiki_parser.parse(body).to_html
      markdown_parser.render(wiki_parsed)
    end

    def to_param
      slug
    end

    private
    def wiki_parser
      Wikitop::Parser.new
    end

    def markdown_parser
      Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                              :autolink => true, :space_after_headers => true)
    end
  end
end
