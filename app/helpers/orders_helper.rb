module OrdersHelper

  def current_order
    current_user.current_order
  end

end
