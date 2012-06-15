# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    rg '10101010'
    cpf '1010101010'
    telefone '1010101010'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end

