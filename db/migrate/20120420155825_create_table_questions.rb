class CreateTableQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :text
      t.integer :user_id, :offering_id
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
