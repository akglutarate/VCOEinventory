class AddItemTitleToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :item_title, :string
  end
end
