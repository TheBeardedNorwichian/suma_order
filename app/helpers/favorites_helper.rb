module FavoritesHelper

  def user_favorites
    current_user.favorites 
  end

end
