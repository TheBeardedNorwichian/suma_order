class ItemsController < ApplicationController

  def index
    if params[:category_id].blank? && params[:brand_id].blank?
      @items = Item.includes(:category, :brand).paginate(page: params[:page], order: params[:sort], per_page: 50).search(params[:search])
    elsif !params[:category_id].blank?
      @items = Item.where("category_id = ?", params[:category_id]).paginate(page: params[:page], order: params[:sort], per_page: 50).search(params[:search])
    elsif !params[:brand_id].blank?
      @items = Item.where("brand_id = ?", params[:brand_id]).paginate(page: params[:page], order: params[:sort], per_page: 50).search(params[:search])
    end
    @alpha_cats = Category.alpha_list
    @alpha_brands = Brand.alpha_list
  end

end
