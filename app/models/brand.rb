# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Brand < ActiveRecord::Base
  has_many :items

  def self.alpha_list
    Brand.all.group_by{ |u| u.name[0].upcase }
  end
end
