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
  has_many :users, through: :orderitems

  def is_current?
    (self.open..self.deadline).cover?(Date.today)
  end

end
