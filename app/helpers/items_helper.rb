module ItemsHelper

  def item_vat(item)
    if item.vat
      vat = item.price * 0.2
    else
      vat = 0.0
    end
  end

  def item_vat_total(item)
    if item.vat
      vat_total = item.price + item_vat(item)
    else
      vat_total = item.price
    end
  end
end
