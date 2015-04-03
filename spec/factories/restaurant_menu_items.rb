# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant_menu_item, :class => 'RestaurantMenu::Item' do
    category_id 123
    title "MyString"
    ingredients "MyText"
    cost "9.99"
    note "MyText"
  end
end
