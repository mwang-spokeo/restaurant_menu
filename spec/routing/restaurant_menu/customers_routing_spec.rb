require 'spec_helper'

describe RestaurantMenu::CustomersController do
  describe "routing" do
    it "routes #index" do
      expect(get: '/customers').to route_to(controller: 'restaurant_menu/customers', action: 'index')
    end
  end
end
