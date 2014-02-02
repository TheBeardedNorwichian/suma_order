# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  description :string(255)
#  details     :string(255)
#  price       :decimal(8, 2)
#  rrp         :decimal(8, 2)
#  size        :string(255)
#  category_id :integer
#  brand_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  unit_price  :decimal(8, 2)
#  vat         :decimal(, )      default(0.0)
#

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
