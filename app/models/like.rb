class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true


  # update likes counter of post after save
  after_save do |like|
    like.post.update(likes_counter: like.post.likes.count)
  end
end