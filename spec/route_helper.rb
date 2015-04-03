module RouteHelper
  def self.included(base)
    base.routes {RestaurantMenu::Engine.routes}
  end
end
