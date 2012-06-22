# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    street "123"
    number "123"
    complement ""
    neightborhood "123"
    city "123"
    state "123"
    country "MyString"
  end
end
