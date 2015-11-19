FactoryGirl.define do
  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :user do
    name 'John Doe'
    email
    password 'foobar'
    password_confirmation 'foobar'

    trait :other_user do
      name 'Jane Doe'
    end
  end
end
