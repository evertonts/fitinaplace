#!/bin/env ruby
# encoding: utf-8

### UTILITY METHODS ###


def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "please", :password_confirmation => "please", :cpf => "123456", 
    :rg => "123456", :telefone => "12345678", :role => "site_user" }
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email], cpf: @visitor[:cpf], rg: @visitor[:rg], 
    telefone: @visitor[:telefone], role: @visitor[:role])
end

def create_other_user
  @other = FactoryGirl.create(:user, name: "Outro", email: "outro@mail.com")
end

def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  fill_in "user_cpf", :with => @visitor[:cpf]
  fill_in "user_rg", :with => @visitor[:rg]
  fill_in "user_telefone", :with => @visitor[:telefone]
  click_button ""
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button ""
end

def send_message message
  visit "/users/" + @other.id.to_s
  fill_in "Mensagem", :with => message
  click_button "Enviar"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "edit_user"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button ""
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I send a message to other user "(.*?)"$/ do |message|
  create_other_user
  send_message(message)
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Minhas ofertas"
end

Then /^I should be signed out$/ do
  page.should have_content "Cadastrar-se"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "Antes de continuar, confirme a sua conta."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Login efetuado com sucesso!"
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Uma mensagem de confirmação foi mandada para o seu email."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email não é válido"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Senha não pode ficar em branco"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Senha não está de acordo com a confirmação"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Senha não está de acordo com a confirmação"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Saiu com sucesso."
end

Then /^I see an invalid login message$/ do
  page.should have_content "E-mail ou senha inválidos."
end

Then /^I should see an account edited message$/ do
  page.should have_content "Sua conta foi atualizada com sucesso."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I should be in the sign in page$/ do
  page.should have_content "Criar uma conta"
end

Then /^I should see this message on my inbox "(.*?)"$/ do |message|
  visit "/users/" + @user.id.to_s
  page.should have_content(message)
end