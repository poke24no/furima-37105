FactoryBot.define do
  factory :buyer_address do
    add_number            {123-1234}
    prefecture_id         {1}
    city                  {"横浜市"}
    address               {1234}
    telephone             {12312341234}
    building              {"ハイツ"}
    association :item
    association :user
  end
end
