class AddColumnToExchange < ActiveRecord::Migration
  def change
    add_column :exchanges, :active, :boolean, default: false
  end
end
