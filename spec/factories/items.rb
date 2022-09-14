FactoryBot.define do
  factory :item do
    title             {Faker::Lorem.word}
    content           {Faker::Lorem.sentence}
    category_id       {2}
    condition_id      {2}
    shipping_fee_id   {2}
    shipping_area_id  {2}
    shipping_days_id  {2}
    price             {Faker::Number.number(digits: 5)}
    user_id           {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
