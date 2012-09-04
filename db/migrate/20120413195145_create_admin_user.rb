class CreateAdminUser < ActiveRecord::Migration
  def up
    user = User.new(:name => "Admin", :email => "kotoshimoda@gmail.com", :cpf => "00000000001", 
      :rg => "000000000", :telefone => "00000000", :password => "Clhafe03", :password_confirmation => "Clhafe03", :role => :admin)
    user.save!
  end

  def down
    user = User.where(:name => "Admin").first.id
    User.destroy user.id
  end
end
