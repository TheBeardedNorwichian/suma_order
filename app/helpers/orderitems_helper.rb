module OrderitemsHelper

  def total_price(orderitems)
    price = 0.0
    orderitems.each do |oi|
      if oi.item.vat
        xvat = oi.item.price * 1.20
        price += xvat
      else
        price += oi.item.price
      end
    end
    return price
  end

end
