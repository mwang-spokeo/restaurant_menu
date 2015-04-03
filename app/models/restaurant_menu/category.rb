module RestaurantMenu
  class Category < ActiveRecord::Base
    has_many :items
  end
end
