class Post < ApplicationRecord
  has_many :comments, class_name: "Comment"
  has_many :likes, class_name: "Like"
  
  belongs_to :users

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
