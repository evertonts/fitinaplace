def new_house1
  @house = FactoryGirl.create(:house)
end

def new_resource
  visit "/resources/new?house_id=1"
  click_button ""
end

def new_resource_without_house
  visit "/resources/new"
  click_button ""
end

When /^I create a new resource$/ do
  new_house1
  new_resource
end

When /^I try to create a new resource without a house$/ do
  new_resource_without_house
end

Then /^I should see a resource created message$/ do
  page.should have_content "Recurso criado com sucesso."
end

Then /^I should not see an the new message page$/ do
  page.should_not have_content "Novo Recurso"
end

