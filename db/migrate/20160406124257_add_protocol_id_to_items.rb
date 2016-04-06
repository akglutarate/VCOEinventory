class AddProtocolIdToItems < ActiveRecord::Migration
  def change
		add_column :items, :protocol_id, :integer
  end
end
