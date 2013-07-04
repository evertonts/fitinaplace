class RemoveAddressCityAndStateFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :address
    remove_column :events, :city
    remove_column :events, :state
  end

  def down
    add_column :events, :address, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
  end
end
