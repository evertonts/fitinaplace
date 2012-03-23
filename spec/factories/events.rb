# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    user_id 1
    date "2012-03-23"
  end
end
