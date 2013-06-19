# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  description :string(255)
#  details     :string(255)
#  price       :integer
#  size        :string(255)
#  category_id :integer
#  brand_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
