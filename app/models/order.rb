# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  orderopen    :date
#  deadline     :date
#  delivery     :date
#  order_sent   :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  active_order :boolean
#

class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :users, through: :orderitems

  def user_total(user)
    user_total = 0.0
    self.orderitems.each do |oi|
      if oi.user_id == user.id
        user_total += oi.item.price_inc_vat
      end
    end
    return user_total
  end

  def is_closed?
    if self.deadline < Date.today
      return true
    else
      return false
    end
  end

  def self.set_active(order)
    Order.all.each do |inactive|
      inactive.active_order = false
      inactive.save
    end
    order.active_order = true
    order.save
  end

end
