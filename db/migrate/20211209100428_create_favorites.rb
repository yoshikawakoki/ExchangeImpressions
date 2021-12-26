class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :post, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: 

      t.timestamps
    end
  end
end
