class ItemsController < ApplicationController

  def index
    @items = Item.includes(:category, :brand).paginate(page: params[:page], order: params[:sort], per_page: 100).search(params[:search])
  end

  def search
    @items = Item.includes(:category, :brand).paginate(page: params[:page], order: params[:sort], per_page: 100).search(params[:search])
  end

end
