# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  notes      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

end
