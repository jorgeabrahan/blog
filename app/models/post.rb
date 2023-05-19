class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments, dependent: :destroy, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def all_comments
    comments.order(created_at: :asc)
  end

  after_create :increment_post_counter

  private

  def increment_post_counter
    author.increment!(:post_counter)
  end
end
