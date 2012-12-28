module Wacky
  class PagesController < Wacky::ApplicationController
    def show
      load_page
    end

    def new
      @page = Page.new slug: params[:id]
    end

    def create
      @page = Page.new(params[:page])
      if @page.save
        redirect_to @page, notice: "Page created successfully."
      else
        render 'new', error: 'There was a problem creating the page.'
      end
    end

    protected
    def load_page
      @page = Page.find_by_slug(params[:id])
      redirect_to new_page_path(id: params[:id]) unless @page
    end
  end
end
