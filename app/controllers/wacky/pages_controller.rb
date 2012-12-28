module Wacky
  class PagesController < Wacky::ApplicationController
    def show
      load_page
    end

    def new
      @page = Page.new slug: params[:id]
    end

    def edit
      load_page
    end

    def update
      if @page.update_attributes(params[:page])
        redirect_to @page, notice: "Page updated successfully."
      end
    end

    protected
    def load_page
      @page = Page.find_by_slug(params[:id])
      redirect_to new_page_path(params[:id]) unless @page
    end
  end
end
