FactoryBot.define do
  factory :menu_item do
    menu { nil }
    category { "MyString" }
    item_name { "MyString" }
    description { "MyText" }
    price { "MyString" }
    image_url { "MyString" }
  end
end
