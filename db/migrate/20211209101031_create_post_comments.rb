class CreatePostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :content
      t.integer :parent_id

      t.timestamps
    end
  end
end
