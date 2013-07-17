module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Bond Street:SUMA"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def item_plus_vat(item)
    if item.vat == 1
      return item.price
    else
      return item.price * (1 + item.vat)     
    end
  end

end
