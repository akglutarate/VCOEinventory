class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :exchanges, :borrow, :borrower
    rename_column :exchanges, :lend, :lender
  end
end
