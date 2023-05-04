class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author, :integer
    add_index :posts, :author
  end
end
