class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true


  # update comments counter of post after save
  after_save do |comment|
    comment.post.update(comments_counter: comment.post.comments.count)
  end
end