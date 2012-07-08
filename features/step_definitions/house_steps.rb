def create_house
  @house ||= {:street => "Teste", :number => 123, :city => "Teste", :state => "Teste", :neightborhood => "Rochdalle", :country => "Brasil"}
end

def new_house
  visit '/houses/new'
  fill_in "house_street", :with => @house[:street]
  fill_in "house_number", :with => @house[:number]
  fill_in "house_city", :with => @house[:city]
  fill_in "house_state", :with => @house[:state]
  fill_in "house_neightborhood", :with => @house[:neightborhood]
  fill_in "house_country", :with => @house[:country]
  click_button ""
end

def create_other_user
  @user = User.new(:name => "McLoving", :email => "example2@example.com",
    :password => "please", :password_confirmation => "please", :cpf => "12345678", 
    :rg => "123456", :telefone => "12345678", :role => "site_user")
end

def create_others_house
  @others_house = FactoryGirl.create(:house, street: @house[:street], number: @house[:number], neightborhood: @house[:neightborhood], 
    city: @house[:city], state: @house[:state], country: @house[:country])
  @others_house.user = @user
end

def try_to_edit_others_house
  visit "/houses/#{@others_house.id}/edit"
end

When /^I create a new house$/ do
  create_house
  new_house
end

When /^I edit this house$/ do
  house = House.last
  visit "/houses/#{house.id}/edit"
  fill_in "house_street", :with => "Rua 2"
  click_button ""
  
end

When /^I try to edit other person's house$/ do
  create_house
  create_other_user
  create_others_house
  try_to_edit_others_house
end

Then /^I should see an house created message$/ do
  page.should have_content "Casa criada com sucesso."
end

Then /^I should see an house updated message$/ do
  page.should have_content "Casa foi atualizada com sucesso."
end

Then /^I should see my home page$/ do
  page.should have_content "Minhas ofertas"
end