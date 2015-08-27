class PagesController < ApplicationController

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(page_params)
  end

  private
    def page_params
      params.require(:page).permit(:layout, :content)
    end
end
