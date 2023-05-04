class Post < ApplicationRecord
  has_many :comments, class_name: "Comment"
  has_many :likes, class_name: "Like"
  
  belongs_to :users

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
