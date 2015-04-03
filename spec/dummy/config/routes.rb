Rails.application.routes.draw do

  mount RestaurantMenu::Engine => "/restaurant_menu"
end
