FactoryBot.define do
  factory :comment do

  message     {Faker::Lorem.sentence}
  association :user
  association :word

    
  end
end
