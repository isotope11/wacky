module Wacky
  class PagesController < Wacky::ApplicationController
    def show
      load_page
    end

    def new
      @page = Page.new
      @page.slug = params[:id]
    end

    def create
      @page = Page.new
      @page.slug = params[:page]['slug']
      @page.body = params[:page]['body']
      if @page.save
        redirect_to @page, notice: "Page created successfully."
      else
        render 'new', error: 'There was a problem creating the page.'
      end
    end

    def edit
      load_page
    end

    def update
      load_page
      @page.body = params[:page]['body']
      @page.save
      redirect_to @page
    end

    def versions
      load_page
    end

    def version
      load_page
      @page = @page.versions[params[:version].to_i].reify
    end

    def revert_to_version
      load_page
      @page = @page.versions[params[:version].to_i].reify
      @page.save
      redirect_to @page
    end

    protected
    def load_page
      @page = Page.find_by_slug(params[:id])
      redirect_to new_page_path(id: params[:id]) unless @page
    end
  end
end
