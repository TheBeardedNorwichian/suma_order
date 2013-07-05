module OrderitemsHelper

  def total_price(items)
    price = 0.0
    items.each do |x|
      if x.item.vat
        xvat = x.item.price * 1.20
        price += xvat
      else
        price += x.item.price
      end
    end
    return price
  end

end
