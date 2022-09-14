FactoryBot.define do
  factory :item do
    title             {Faker::Lorem.word}
    content           {Faker::Lorem.sentence}
    category_id       {'1'}
    condition_id      {'1'}
    shipping_fee_id   {'1'}
    shipping_area_id  {'1'}
    shipping_days_id  {'1'}
    price             {Faker::Number.number(digits: 5)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
