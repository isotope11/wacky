require 'nokogiri'

module Wacky
  class ExtractsTitle
    attr_reader :doc

    def initialize(doc)
      @doc = doc
    end

    def title
      matching_title ? matching_title.text : nil
    end

    private
    def potential_title_selector_parts
      %w(h1 h2 h3 h4 h5 h6)
    end

    def potential_title_selector
      potential_title_selector_parts.join(',')
    end

    def nokogiri_doc
      Nokogiri::HTML(doc)
    end

    def potential_titles
      nokogiri_doc.css(potential_title_selector)
    end

    def matching_title
      potential_titles.first
    end
  end
end
