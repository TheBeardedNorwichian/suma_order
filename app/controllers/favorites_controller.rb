class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
    @fav = Favorite.where(id: params[:id])
    store_location
  end

  def create
    @fav = Favorite.where(id: params[:id])
    @new_fav = Favorite.new(favorite_params)
    @new_fav.save
    respond_to do |format|
      format.html do
        flash[:success] = "#{@new_fav.item.description} has been added to your favorites"
        redirect_to session[:return_to]
      end
      format.js
    end
  end

  def destroy
    @fav = Favorite.where(id: params[:id])
    @remove_fav = Favorite.find(params[:id]).destroy
    respond_to do |format|
      format.html do
        flash[:error] = "#{@remove_fav.item.description} has been removed from your favorites"
        redirect_to session[:return_to]  
      end
      format.js
    end
  end

    private

    def favorite_params
      params.permit(:user_id, :item_id, :id)
    end

end
