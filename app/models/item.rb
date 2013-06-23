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

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand

  before_save :code_upper

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true

  def self.search(search)
    if search
      find(:all, joins: [:category, :brand], conditions: ['description LIKE ? OR code LIKE ? or categories.name LIKE ? or brands.name LIKE ?', "%#{search.capitalize}%", "%#{search.upcase}%", "%#{search.capitalize}%", "%#{search.capitalize}%"])
    else
      find(:all)
    end 
  end

  private

    def code_upper
      self.code = code.upcase
    end

end
