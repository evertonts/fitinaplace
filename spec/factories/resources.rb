# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    breakfast false
    lunch false
    dinner false
    private_bathroon false
    private_space false
    parking_spaces 1
    description "MyString"
    picture "MyString"
    vacancies 1
  end
end
