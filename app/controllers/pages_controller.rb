class PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
    redirect_to root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, blocks_attributes: [ :child_index  [:page_id, :body, :block_type]])
  end

end
