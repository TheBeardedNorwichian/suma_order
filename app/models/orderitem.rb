# == Schema Information
#
# Table name: orderitems
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Orderitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :order 
  belongs_to :item

  default_scope { order('item_id ASC') }

  def self.user_orderitems(order, user)
    where(order_id: order).where(user_id: user)
  end

end
