module OrdersHelper

  def active_order
    Order.where(active_order: true).first
  end

  def order_date_format(date)
    "#{date.strftime("%A")}, #{date.to_date.to_formatted_s(:long_ordinal)}"
  end
  

end
