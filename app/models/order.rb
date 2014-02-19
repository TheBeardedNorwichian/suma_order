# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  open         :date
#  deadline     :date
#  delivery     :date
#  order_sent   :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  active_order :boolean
#

class Order < ActiveRecord::Base
  has_many :orderitems

  def user_total(user)
    user_total = 0.0
    self.orderitems.each do |oi|
      if oi.user_id == user.id
        user_total += oi.item.price
      end
    end
    return user_total
  end

  def check_order_deadline
    if self.deadline > Date.today
      @can_order = fasle
    end
  end



end
