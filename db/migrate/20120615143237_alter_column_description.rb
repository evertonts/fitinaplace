20120810215604_add_slug_to_event.rbclass AlterColumnDescription < ActiveRecord::Migration
  def up
     change_table :events do |t|
      t.change :description, :text
  end
  end

  def down
       change_table :events do |t|
      t.change :description, :string
  end
  end
end
