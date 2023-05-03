class Like < ApplicationRecord
  belongs_to :posts, :users
end
