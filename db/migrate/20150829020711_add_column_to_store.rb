class AddColumnToStore < ActiveRecord::Migration
  def change
    add_column :stores, :address, :string
    add_column :stores, :place_id, :string
  end
end
