class Post < ActiveRecord::Base
  has_many :comment, dependent: :destroy
end
