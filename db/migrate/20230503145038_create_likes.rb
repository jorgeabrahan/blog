class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
