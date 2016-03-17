class AddBorrowTimeToExcahnges < ActiveRecord::Migration
  def change
    add_column :exchanges, :borrowed_time, :string
  end
end
