module OrdersHelper

  def current_order
    current_user.group.current_order
  end

end
