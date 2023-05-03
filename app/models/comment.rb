class Comment < ApplicationRecord
  has_many :users, :posts
end
