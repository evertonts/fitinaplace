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


When /^I create a new house$/ do
  create_house
  new_house
end

Then /^I should see an house created message$/ do
  page.should have_content "House was successfully created"
end
