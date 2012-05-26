class AddTituloOferta < ActiveRecord::Migration
  def change
    add_column :offerings, :titulo, :string

  end
end