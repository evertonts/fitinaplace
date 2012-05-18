def create_event
  @event ||= {:name => "Teste", :description => "Teste", :address => "Teste", :city => "Teste", :state => "Teste"}
end

def new_event
  visit '/events/new'
  fill_in "Name", :with => @event[:name]
  fill_in "Description", :with => @event[:name]
  fill_in "Address", :with => @event[:name]
  fill_in "City", :with => @event[:name]
  fill_in "State", :with => @event[:name]
  click_button "Create Event"
end

def edit_event
  event = Event.last
  visit "/events/#{event.id}/edit"
  fill_in "Name", :with => @event[:name]
  click_button "Update Event"
  
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
  page.should have_content "Event was successfully created"
end

When /^I edit this event$/ do
  edit_event
end

Then /^I should see an event updated message$/ do
  page.should have_content "Event was successfully updated."
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
