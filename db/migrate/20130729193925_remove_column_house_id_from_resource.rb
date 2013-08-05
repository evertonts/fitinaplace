class RemoveColumnHouseIdFromResource < ActiveRecord::Migration
  def up
    remove_column :resources, :house_id
  end

  def down
    add_column :resources, :house_id, :integer
  end
end
