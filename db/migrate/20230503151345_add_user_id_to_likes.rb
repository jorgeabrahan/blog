class AddUserIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users, column: :author_id, null: false, foreign_key: true
    add_index :likes, :users
  end
end
