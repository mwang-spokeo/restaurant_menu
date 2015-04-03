RestaurantMenu::Engine.routes.draw do
  resources :customers, only: [:index]
  resources :categories do
    resources :items
  end
end
