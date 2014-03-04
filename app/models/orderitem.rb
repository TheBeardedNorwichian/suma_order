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
  validate :check_order_deadline
  validate :check_order_active

# scope for collecting a specific users orderitems for a specific order
  def self.user_orderitems(order, user)
    where(order_id: order).where(user_id: user)
  end

# either create a new OI line or add 1 to an existing line
  def self.add_oi(oi)
    item_to_add = Orderitem.where(item_id: oi.item_id).where(order_id: oi.order_id).where(user_id: oi.user_id).first
    if item_to_add
      item_to_add.quantity += 1
    else
      item_to_add = Orderitem.new(item_id: oi.item_id, order_id: oi.order_id, user_id: oi.user_id)
    end
    return item_to_add
  end

  # if OI object passed has a quantity greater than one, reduce it otherwise delete it
  def self.remove_oi(oi)
    if oi.quantity > 1
      oi.quantity -= 1
      oi.save
      return oi
    else
      removed_oi = Orderitem.where(id: oi.id).first.destroy
      if removed_oi.destroyed?
        puts "#{removed_oi.item.description} destroyed."
      end
      return removed_oi
    end
  end

    private

      def check_order_deadline
        if self.order.is_closed?
          errors.add(:order_deadline, "The order has closed")
        end
      end

      def check_order_active
        unless self.order.active_order
          errors.add(:order_not_active, "This order is not active")
        end
      end

end