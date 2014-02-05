module OrderitemsHelper

  def total_price(orderitems)
    total_price = 0.0
    orderitems.each do |oi|
        total_price += ( item_plus_vat(oi.item) * oi.quantity )
    end
    return total_price
  end

end
