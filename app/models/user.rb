class User < ApplicationRecord
  has_many :comments, :posts
end
