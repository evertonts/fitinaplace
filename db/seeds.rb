#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#puts 'SETTING UP DEFAULT USER LOGIN'
#admin = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', 
#  :password_confirmation => 'please', :cpf => "1", :rg => "1", :telefone => "1", :role => "admin",
#  :confirmed_at => DateTime.now
  
#user = User.create! :name => 'First User', :email => 'user2@example.com', :password => 'please', 
#    :password_confirmation => 'please', :cpf => "12", :rg => "12", :telefone => "1", :role => "site_user",
#    :confirmed_at => DateTime.now
    
#puts 'New user created: ' << user.name << " " << admin.name

#Create example data 

Event.create! :name => "Rock' n Rio", :description => "Grande evento músical que acontece no Rio de Janeiro", 
	:address => "", :city => "Rio de Janeiro", :state => "Rio de Janeiro", :user_id => 1, :date => "2013-09-13"

Event.create! :name => "Abertura da Copa", :description => "Abertura da copa do mundo de 2014", 
	:address => "", :city => "São Paulo", :state => "São Paulo", :user_id => 1, :date => "2014-07-01"
