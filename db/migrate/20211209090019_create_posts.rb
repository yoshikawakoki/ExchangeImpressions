class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :place, null: false
      t.text :image, null: false
      t.text :body, null: false
      #t.float :evaluation, null: false

      t.timestamps
    end
  end
end
