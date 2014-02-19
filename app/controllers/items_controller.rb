class ItemsController < ApplicationController
  skip_before_action :require_login

  def index
    if params[:category_id].blank? && params[:brand_id].blank?
      @items = Item.includes(:category, :brand).order(:description).paginate(page: params[:page], order: params[:sort], per_page: 15).search(params[:search])
    elsif !params[:category_id].blank?
      @items = Item.where("category_id = ?", params[:category_id]).order(:description).paginate(page: params[:page], order: params[:sort], per_page: 15).search(params[:search])
    elsif !params[:brand_id].blank?
      @items = Item.where("brand_id = ?", params[:brand_id]).order(:description).paginate(page: params[:page], order: params[:sort], per_page: 15).search(params[:search])
    end
    store_location
  end

  private



end
