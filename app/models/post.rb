class Post < ApplicationRecord
  has_many :comments, class_name: "Comment"
  has_many :likes, class_name: "Like"
  
  belongs_to :users
end
