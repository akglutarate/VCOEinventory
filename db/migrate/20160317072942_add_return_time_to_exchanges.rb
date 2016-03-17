class AddReturnTimeToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :return_time, :string
  end
end
