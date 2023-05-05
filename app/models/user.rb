class User < ApplicationRecord
  has_many :comments, class_name: 'Comment'
  has_many :posts, class_name: 'Post'
  has_many :likes, class_name: 'Like'

  validates :name, presence: true
  validates :name, lenght: { maximum: 200 }
  validates :photo, format: { with: /\Ahttps:\/\/.*\z/, message: "must start with https://" }
  validates :bio, length: { maximum: 250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
