class ProtocolsTable < ActiveRecord::Migration
  def change
		create_table :protocols do |t|
			t.string :name
			t.integer :amount
      t.timestamps
    end
  end
end
