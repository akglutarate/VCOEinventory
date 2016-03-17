class CreateExchangesTable < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :borrow
      t.integer :lend
      t.timestamps
    end
  end
end
