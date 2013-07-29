class RemoveColumnGradeFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :grade
  end

  def down
    add_column :comments, :grade, :integer
  end
end
