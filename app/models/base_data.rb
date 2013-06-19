# == Schema Information
#
# Table name: base_data
#
#  id            :integer          not null, primary key
#  category_name :string(255)
#  brand         :string(255)
#  code          :string(255)
#  description   :string(255)
#  details       :string(255)
#  size          :string(255)
#  price         :decimal(, )
#  vat           :boolean
#  rrp           :decimal(, )
#  b             :boolean
#  f             :boolean
#  g             :boolean
#  o             :boolean
#  s             :boolean
#  v             :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class BaseData < ActiveRecord::Base

  validates :category_name, presence: true
  validates :code, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
