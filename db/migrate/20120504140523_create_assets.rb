class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :resource_id
      t.has_attached_file :image
      t.timestamps
    end
  end
end
