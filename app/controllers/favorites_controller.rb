class FavoritesController < ApplicationController

  def index
    store_location
  end

  def create
    @new_fav = Favorite.new(favorite_params)
    if @new_fav.save
      flash[:success] = "#{@new_fav.item.description} has been added to your favorites"
      redirect_to session[:return_to]
    else
      flash[:error] = "You have already added #{@new_fav.item.description} to your favorites"
      redirect_to session[:return_to]    
    end
  end

  def destroy
    @remove_fav = Favorite.find(params[:id]).destroy
    flash[:error] = "#{@remove_fav.item.description} has been removed from your favorites"
    redirect_to session[:return_to]  
  end

    private

    def favorite_params
      params.permit(:user_id, :item_id, :id)
    end

end
