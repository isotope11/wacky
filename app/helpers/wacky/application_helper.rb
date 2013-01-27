module Wacky
  module ApplicationHelper
    def wacky_title
      title = "Wacky"
      additional_title = @title
      [additional_title, title].compact.join(' - ')
    end
  end
end
