module OrdersHelper

  def active_order
    Order.where(active_order: true).first
  end

end
