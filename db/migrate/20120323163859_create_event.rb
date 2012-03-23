class CreateEvent < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name, :description, :address, :city, :state
      t.integer :user_id
      t.date :date
    end
  end

  def down
    drop_table :events
  end
end
