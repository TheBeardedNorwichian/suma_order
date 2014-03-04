module ItemsHelper

  def is_favorite?(item)
    if Favorite.where(item_id: item.id, user_id: current_user.id).first
      true
    else
      false
    end
  end

  def is_on_order?(item)
    item_on_order = Orderitem.where(item_id: item.id, user_id: current_user, order_id: active_order).first
    if item_on_order
      return true
    else
      return false
    end
  end

end
