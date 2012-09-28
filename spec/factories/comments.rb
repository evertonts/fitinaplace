# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    commenter_id 1
    comment "MyText"
    grade 1
  end
end
