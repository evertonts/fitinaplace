class AlterNameSpaceId < ActiveRecord::Migration
  def up
    rename_column :offerings, :space_id, :resource_id
  end

  def down
  end
end
