module ItemsHelper

  def is_favorite?(item)
    if Favorite.where(item_id: item.id, user_id: current_user.id).first
      true
    else
      false
    end
  end

end
