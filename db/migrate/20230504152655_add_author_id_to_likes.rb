class AddAuthorIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :author, :integer
    add_index :likes, :author
  end
end
