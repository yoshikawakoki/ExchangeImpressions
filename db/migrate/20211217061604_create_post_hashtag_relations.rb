class CreatePostHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_hashtag_relations do |t|
      t.references :post, type: :integer, foreign_key: true
      t.references :hashtag, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
