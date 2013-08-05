class AddHouseToResource < ActiveRecord::Migration
  def change
  	add_column :resources, :house, :boolean
  end
end
