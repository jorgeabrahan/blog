class User < ApplicationRecord
  has_many :comments, class_name: "Comment"
  has_many :posts, class_name: "Post"
  has_many :likes, class_name: "Like"

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
