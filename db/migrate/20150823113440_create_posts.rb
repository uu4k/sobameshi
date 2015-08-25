class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.string :content
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.timestamps null: false
      t.index [:latitude, :longitude]
      t.index [:user_id,:created_at]
      t.index [:store_id,:created_at]
    end
  end
end
