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
#  quantity   :integer          default(1)
#

class Orderitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :order 
  belongs_to :item

  default_scope { order('item_id ASC') }

  validates :user_id, presence: true
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :item_id, uniqueness: { scope: [:order_id, :user_id] }

  def self.user_orderitems(order, user)
    where(order_id: order).where(user_id: user)
  end

  def self.new_oi(oi)
    oi_to_update = Orderitem.where(item_id: oi.item_id).where(order_id: oi.order_id).where(user_id: oi.user_id).first
    if oi_to_update
      oi_to_update.quantity += 1
    else
      oi_to_update = Orderitem.new(item_id: oi.item_id, order_id: oi.order_id, user_id: oi.user_id)
    end
    oi_to_update.save
  end

  def self.remove_oi(oi)
    if oi.quantity > 1
      oi.quantity -= 1
      oi.save
    else
      Orderitem.where(id: oi.id).first.destroy
    end
  end

end