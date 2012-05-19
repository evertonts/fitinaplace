class CreateTableAddress < ActiveRecord::Migration
  def up
    create_table :address do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neightborhood
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end

  def down
    drop_table :address
  end
end
