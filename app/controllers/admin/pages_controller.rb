class Admin::PagesController < AdminController

  def index
    @pages = Page.all

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end