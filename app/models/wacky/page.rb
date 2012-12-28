module Wacky
  class Page < ActiveRecord::Base
    validates_presence_of :slug
  end
end
