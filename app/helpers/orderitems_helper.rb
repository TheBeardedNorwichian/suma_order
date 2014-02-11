module OrderitemsHelper

  def total_price(orderitems)
    total_price = 0.0
    orderitems.each { |oi| total_price += ( item_plus_vat(oi.item) * oi.quantity ) }
    return total_price
  end

  def current_user_orderitems
    current_user_orderitems = Orderitem.user_orderitems(current_order, current_user)
  end

end
