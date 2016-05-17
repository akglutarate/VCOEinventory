class CreateInstance < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :protocol_id
      t.integer :user_id
      t.integer :amount
    end
  end
end
