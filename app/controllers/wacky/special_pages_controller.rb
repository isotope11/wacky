module Wacky
  class SpecialPagesController < Wacky::ApplicationController
    def recently_updated
      @pages = Page.order("updated_at DESC").limit(10)
    end

    def all_pages
      @pages = Page.order("slug").page(params[:page])
    end
  end
end
