class AddAuthorIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author, :integer
    add_index :comments, :author
  end
end
