class CreateExchangesTable < ActiveRecord::Migration
  def change
    create_table :exchanges_tables do |t|
      t.integer :borrow
      t.integer :lend
      t.timestamps
    end
  end
end
