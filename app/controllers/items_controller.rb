class ItemsController < ApplicationController

  def index
    @items = Item.includes(:category, :brand).order(params[:sort]).limit(50)
  end

end
