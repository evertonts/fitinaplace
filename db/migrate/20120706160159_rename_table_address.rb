class RenameTableAddress < ActiveRecord::Migration
  def change
    rename_table :address, :addresses
  end
end
