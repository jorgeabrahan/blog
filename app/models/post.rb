class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  belongs_to :user

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  private

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
