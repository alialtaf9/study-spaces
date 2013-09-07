class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.references :user
      t.references :room

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :room_id
  end
end
