def create_house
  @house ||= {:street => "Teste", :number => 123, :city => "Teste", :state => "Teste", :neightborhood => "Rochdalle", :country => "Brasil"}
end

def new_house
  visit '/houses/new'
  fill_in "Street", :with => @house[:street]
  fill_in "Number", :with => @house[:number]
  fill_in "City", :with => @house[:city]
  fill_in "State", :with => @house[:state]
  fill_in "Neightborhood", :with => @house[:neightborhood]
  fill_in "Country", :with => @house[:country]
  click_button "Create House"
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
  fill_in "Street", :with => "Rua 2"
  click_button "Update House"
  
end

When /^I try to edit other person's house$/ do
  create_house
  create_other_user
  create_others_house
  try_to_edit_others_house
end

Then /^I should see an house created message$/ do
  page.should have_content "House was successfully created"
end

Then /^I should see an house updated message$/ do
  page.should have_content "House was successfully updated."
end
