# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  open       :date
#  deadline   :date
#  delivery   :date
#  order_sent :boolean
#  created_at :datetime
#  updated_at :datetime
#  group_id   :integer
#

class Order < ActiveRecord::Base
  belongs_to :group
  has_many :orderitems

  def order_users
    self.group.users
  end

  def user_total(user)
    user_total = 0.0
    self.orderitems.each do |oi|
      if oi.user_id == user.id
        user_total += oi.item.price
      end
    end
    return user_total
  end

end
