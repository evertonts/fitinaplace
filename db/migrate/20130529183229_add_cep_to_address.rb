class AddCepToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :cep, :integer
  end
end
