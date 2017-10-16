class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :caption
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pictures, [:user_id, :created_at]
  end
end
