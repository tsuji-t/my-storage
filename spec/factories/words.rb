FactoryBot.define do
  factory :word do

    title       {Faker::Lorem.sentence}
    tug         {Faker::Lorem.sentence}
    text        {Faker::Lorem.sentence}
    association :user
    
  end
end
