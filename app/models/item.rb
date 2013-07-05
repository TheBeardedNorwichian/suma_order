# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  description :string(255)
#  details     :string(255)
#  price       :decimal(8, 2)
#  rrp         :decimal(8, 2)
#  size        :string(255)
#  category_id :integer
#  brand_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  unit_price  :decimal(8, 2)
#  vat         :boolean          default(FALSE)
#

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :items

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true

  def self.search(search)
    if search
      sc = "%#{search.capitalize}%"
      su = "%#{search.upcase}%"
      joins(:category, :brand).where('description LIKE ? OR code LIKE ? or categories.name LIKE ? or brands.name LIKE ?', sc, su, sc, sc).all
    else
      all
    end 
  end

  def price_plus_vat
    if self.vat
      self.price = self.price * 1.20
    end
  end

end
