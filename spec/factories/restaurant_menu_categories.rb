# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant_menu_category, :class => 'RestaurantMenu::Category' do
    title "MyString"
  end
end
