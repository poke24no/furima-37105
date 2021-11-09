FactoryBot.define do
  factory :item do
    item_name          {'商品'}
    explanation        {'商品説明'}
    category_id        {2}
    status_id          {2}
    price              {10000}
    load_id            {2}
    prefecture_id      {2}
    day_id             {2}
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
