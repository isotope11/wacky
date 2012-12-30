module Wacky
  class Page < ActiveRecord::Base
    validates_presence_of :slug
    has_paper_trail

    def to_html
      markdown_parser.render(body)
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
