class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts, counter_cache: true

  private
  # update comments counter of post after save
  after_save do |comment|
    comment.post.update(comments_counter: comment.post.comments.count)
  end
end
