class CreateTableNegociations < ActiveRecord::Migration
  def up
    create_table :negociations do |t|
      t.boolean :status
      t.integer :user_id, :offering_id
      t.timestamps
    end
  end

  def down
    drop_table :negociations
  end

end
