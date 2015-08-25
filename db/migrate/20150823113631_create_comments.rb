class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
      t.index [:post_id, :created_at]
      t.index [:user_id, :created_at]
    end
  end
end
