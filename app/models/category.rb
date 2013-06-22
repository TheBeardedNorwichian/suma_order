# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :items

  def self.alpha_list
    Category.all.group_by{ |u| u.name[0].upcase }
  end

end
