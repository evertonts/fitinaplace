class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.boolean :breakfast
      t.boolean :lunch
      t.boolean :dinner
      t.boolean :private_bathroon
      t.boolean :private_space
      t.integer :parking_spaces
      t.string :description, :place
      t.string :picture
      t.integer :vacancies, :house_id

      t.timestamps
    end
  end
end
