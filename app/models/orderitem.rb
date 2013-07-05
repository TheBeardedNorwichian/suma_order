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

end
