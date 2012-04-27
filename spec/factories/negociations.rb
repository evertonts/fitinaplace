# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :negociation do
    status false
    user_id 1
    offering_id 1
  end
end
