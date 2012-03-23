class AddRgCpfTelefoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rg, :string
    add_column :users, :cpf, :string
    add_column :users, :telefone, :string
  end
end
