class RemoveColumnsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :owner
    remove_column :items, :borrower
    remove_column :items, :borrower_location
  end
end
