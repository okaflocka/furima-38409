FactoryBot.define do
  factory :purchase_address do
    zipcode         {'123-4567'}
    prefecture_id   {3}
    city            {'京都市'}
    address_num     {'四条１−２'}
    name_building   {'祇園ビル'}
    phone_number    {'09012341234'}
  end
end
