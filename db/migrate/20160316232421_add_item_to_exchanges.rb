class AddItemToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :item_id, :integer
  end
end
