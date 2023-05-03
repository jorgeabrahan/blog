class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, column: :author_id, null: false, foreign_key: true
    add_index :posts, :users
  end
end
