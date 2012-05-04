class AddAvatarColumnToEvents < ActiveRecord::Migration

  def up
    change_table :events do |t|
      t.has_attached_file :avatar
    end
  end
  
  def down
    drop_attached_file :events, :avatar
  end
end

  
