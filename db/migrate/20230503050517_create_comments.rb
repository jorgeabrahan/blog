class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
