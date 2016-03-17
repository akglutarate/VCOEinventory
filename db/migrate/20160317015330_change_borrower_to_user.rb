class ChangeBorrowerToUser < ActiveRecord::Migration
  def change
    rename_column :exchanges, :borrower, :user_id
  end
end
