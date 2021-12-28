class CreatePostHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_hashtag_relations do |t|
      t.integer :post_id, foreign_key: true
      t.integer :hashtag_id, foreign_key: true

      t.timestamps
    end
  end
end
