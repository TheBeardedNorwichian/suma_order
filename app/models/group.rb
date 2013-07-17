# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  admin         :integer
#  created_at    :datetime
#  updated_at    :datetime
#  current_order :integer
#

class Group < ActiveRecord::Base
  has_many :users
  has_many :orders, dependent: :destroy
  belongs_to :current_order, class_name: 'Order', foreign_key: 'current_order'
  belongs_to :admin, class_name: 'User', foreign_key: 'admin'

  def users_array
    group_users = []
    self.users.each do |user|
      group_users << user.id.to_i
    end
  end

end
