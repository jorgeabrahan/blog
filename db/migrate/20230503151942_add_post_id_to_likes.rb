class AddPostIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :posts, null: false, foreign_key: true
    add_index :likes, :posts
  end
end