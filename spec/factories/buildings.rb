# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    name "Launch Academy"
    address "33 Harrison ave."
    city "Boston"
    state "MA"
    zip_code "02144"
    description "this is a description"
  end
end
