class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :owner
      t.string :owner_location
      t.string :borrower
      t.string :borrower_location
      t.timestamps
    end
  end
end
