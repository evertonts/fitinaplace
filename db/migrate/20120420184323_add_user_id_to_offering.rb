class AddUserIdToOffering < ActiveRecord::Migration
  def change
    add_column :offerings, :user_id, :integer
  end
end
