def create_event
  @event ||= {:name => "Teste", :description => "Teste", :address => "Teste", :city => "Teste", :state => "Teste"}
end

def new_event
  visit '/events/new'
  fill_in "event_name", :with => @event[:name]
  fill_in "event_description", :with => @event[:name]
  fill_in "event_address", :with => @event[:name]
  fill_in "event_city", :with => @event[:name]
  fill_in "event_state", :with => @event[:name]
  click_button ""
end

def edit_event
  event = Event.last
  visit "/events/#{event.id}/edit"
  fill_in "event_name", :with => @event[:name]
  click_button ""
  
end

def create_user
  @user = User.new(:name => "McLoving", :email => "example1@example.com",
    :password => "please", :password_confirmation => "please", :cpf => "1234567", 
    :rg => "123456", :telefone => "12345678", :role => "site_user")
end

def create_others_event
  @others_event = FactoryGirl.create(:event, name: @event[:name], description: @event[:description], address: @event[:address], 
                                    city: @event[:city], state: @event[:state])
  @others_event.user = @user
end

def try_to_edit_others_event
  visit "/events/#{@others_event.id}/edit"
end

When /^I create a new event$/ do
  create_event
  new_event
end

Then /^I should see an event created message$/ do
  page.should have_content "O Evento foi criado com sucesso."
end

When /^I edit this event$/ do
  edit_event
end

Then /^I should see an event updated message$/ do
  page.should have_content "O Evento foi atualizado com sucesso."
end

When /^I try to edit other person's event$/ do
  create_event
  create_user
  create_others_event
  try_to_edit_others_event
end

Then /^I should see an access denied message$/ do
  page.should have_content "Access denied"
end

Then /^I should not see the edit page$/ do
  page.should_not have_content "Editar evento"
end
