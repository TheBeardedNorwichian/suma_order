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
#

class Order < ActiveRecord::Base

end
