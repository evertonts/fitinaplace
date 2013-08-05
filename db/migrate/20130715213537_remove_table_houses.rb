class RemoveTableHouses < ActiveRecord::Migration
  def up
  	drop_table :houses
  end

  def down
  	create_table (:houses) do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neightborhood
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id
      
      t.timestamps
    end
  end
  
end
