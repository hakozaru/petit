class Post < ActiveRecord::Base
  has_many :comment, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :tfield, presence: true, length: { maximum: 10000 }
end
