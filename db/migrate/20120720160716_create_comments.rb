class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :commenter_id
      t.text :comment
      t.integer :grade

      t.timestamps
    end
  end
end
