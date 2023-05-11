class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true, length: { maximum: 500 }

  after_create :increment_comments_counter

  def who_wrote_it
    author.name
  end

  private

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end
