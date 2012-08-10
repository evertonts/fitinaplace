class AddImageToHouse < ActiveRecord::Migration
  def up
    change_table :houses do |t|
      t.has_attached_file :image
    end
  end
  
  def down
    drop_attached_file :houses, :image
  end
end
