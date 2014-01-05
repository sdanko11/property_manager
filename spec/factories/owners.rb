# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    sequence(:first_name) { |n| "ste#{n}e" }
    sequence(:last_name) { |n| "Dan#{n}e" }
    email_address "steve@gmail.com"
    company_name "The Bosses"
  end
end
