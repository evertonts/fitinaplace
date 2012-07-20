def create_offering
  @offering ||= {:event_id => 1, :space_id => 1, :price => 9.99}
end

def new_offering
  visit '/offerings/new'
  fill_in "Preco", :with => @offering[:price]
  click_button "Create Event"
end

Then /^I create a new offering for this event$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an offering created message$/ do
  pending # express the regexp above with the code you wish you had
end
