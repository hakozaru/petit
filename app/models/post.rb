class Post < ActiveRecord::Base
  has_many :comment, dependent: :destroy
  belongs_to :user
end
