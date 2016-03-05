class User < ActiveRecord::Base
  has_secure_password
  has_many :post, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
end
