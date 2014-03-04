# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  street          :string(255)
#  house_number    :integer
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :orderitems
  has_many :orders, through: :orderitems
  has_many :favorites

  before_save { email.downcase! }
  before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }

  def distinct_orders
    self.orders.group("order_id")
  end

  def self.clear_order(user_id)
    oi_to_clear = Orderitem.where(order_id: Order.where(active_order: true).first, user_id: user_id)
    oi_to_clear.each do |oi|
      oi.destroy
    end
  end 

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
