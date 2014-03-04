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

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
