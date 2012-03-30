# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    street ""
    number ""
    complement ""
    neightborhood ""
    city ""
    state ""
    country "MyString"
  end
end
