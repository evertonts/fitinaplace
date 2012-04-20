class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :id_event
      t.integer :id_space
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
