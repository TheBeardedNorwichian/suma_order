module ItemsHelper

  def item_plus_vat(item)
    if item.vat == 1
      return item.price
    else
      return item.price * (1 + item.vat)     
    end
  end

end
