class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true, length: { maximum: 50 }
end
