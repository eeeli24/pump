FactoryGirl.define do
  factory :resource do
    title 'A programming tutorial'
    description 'Teaches you programming'
    user

    trait :other_user_resource do
      title 'A knitting tutorial'
      description 'Teaches you knitting'
      association :user, :other_user
    end
  end
end
