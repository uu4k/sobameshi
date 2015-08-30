class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :address, :string
    add_column :posts, :place_id, :string
  end
end
