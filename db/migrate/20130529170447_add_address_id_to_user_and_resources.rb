class AddAddressIdToUserAndResources < ActiveRecord::Migration
  def change
  	 add_column :users, :address_id, :integer
  	 add_column :resources, :address_id, :integer
  end
end
