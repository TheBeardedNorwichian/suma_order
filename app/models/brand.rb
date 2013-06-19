# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  brand      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Brand < ActiveRecord::Base
  has_many :items
end
