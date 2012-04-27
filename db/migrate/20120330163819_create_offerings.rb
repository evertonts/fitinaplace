class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :event_id
      t.integer :space_id
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
