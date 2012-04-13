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

When /^I create a new event$/ do
  create_event
  new_event
end

Then /^I should see an event created message$/ do
  page.should have_content "Event was successfully created"
end
