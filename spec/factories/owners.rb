# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Steve"
    last_name "Danko"
    email_address "steve@gmail.com"
    company_name "The Bosses"
  end
end
