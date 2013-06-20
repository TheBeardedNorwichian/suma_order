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

  private

    def code_upper
      self.code = code.upcase
    end

end
