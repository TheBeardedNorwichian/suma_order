# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(2\55)
#  admin      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :users
  has_many :orders, dependent: :destroy
  belongs_to :admin, class_name: 'User', foreign_key: 'admin'
end
