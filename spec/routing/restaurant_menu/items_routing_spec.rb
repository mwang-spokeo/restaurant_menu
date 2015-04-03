require "spec_helper"

describe RestaurantMenu::ItemsController do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/categories/123/items/new").to route_to(controller: 'restaurant_menu/items', action: 'new', category_id: '123')
    end

    it "routes to #edit" do
      expect(:get => "/categories/123/items/1/edit").to route_to(controller: 'restaurant_menu/items', action: 'edit', id: '1', category_id: '123')
    end

    it "routes to #create" do
      expect(:post => "/categories/123/items").to route_to(controller: 'restaurant_menu/items', action: 'create', category_id: '123')
    end

    it "routes to #update" do
      expect(:put => "/categories/123/items/1").to route_to(controller: 'restaurant_menu/items', action: 'update', id: '1', category_id: '123')
    end

    it "routes to #destroy" do
      expect(:delete => "/categories/123/items/1").to route_to(controller: 'restaurant_menu/items', action: 'destroy', id: '1', category_id: '123')
    end
  end
end
