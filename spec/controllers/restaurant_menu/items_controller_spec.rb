require 'spec_helper'

describe RestaurantMenu::ItemsController do
  let!(:item){FactoryGirl.create(:restaurant_menu_item)}

  describe "GET new" do
    it "assigns a new item as @item" do
      get :new, category_id: 123
      expect(assigns(:item)).to be_a_new(RestaurantMenu::Item)
      expect(assigns(:item).category_id).to eql(123)
    end
  end

  describe "GET edit" do
    it "assigns the requested item as @item" do
      get :edit, id: item.id, category_id: 123
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        items = RestaurantMenu::Item.where(category_id: 1)
        expect(items.size).to eql(0)
        post :create, category_id: 1, title: 'New Item', ingredients: 'blah blah', cost: '8.99'
        items = RestaurantMenu::Item.where(category_id: 1)
        expect(items.size).to eql(1)
      end

      it "assigns a newly created item as @item" do
        post :create, category_id: 1, title: 'New Item', ingredients: 'blah blah', cost: '8.99'
        expect(assigns(:item)).to be_a(RestaurantMenu::Item)
      end

      it "redirects to the created item" do
        post :create, category_id: 1, title: 'New Item', ingredients: 'blah blah', cost: '8.99'
        expect(response).to redirect_to('/restaurant_menu/categories/1')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        allow_any_instance_of(RestaurantMenu::Item).to receive(:save).and_return(false)
        post :create, category_id: 1, title: 'New Item', ingredients: 'blah blah', cost: 'Invalid cost'
        expect(assigns(:item)).to be_a_new(RestaurantMenu::Item)
      end

      it "renders the 'new' template" do
        allow_any_instance_of(RestaurantMenu::Item).to receive(:save).and_return(false)
        post :create, category_id: 1, title: 'New Item', ingredients: 'blah blah', cost: 'Invalid cost'
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested item" do
        put :update, id: item.id, category_id: 123, note: 'new note'
        item.reload
        expect(item.note).to eql('new note')
      end

      it "assigns the requested item as @item" do
        put :update, id: item.id, category_id: 123, note: 'new note'
        expect(assigns(:item)).to eq(item)
      end

      it "redirects to the item" do
        put :update, id: item.id, category_id: 123, note: 'new note'
        expect(response).to redirect_to('/restaurant_menu/categories/123')
      end
    end

    describe "with invalid params" do
      it "assigns the item as @item" do
        allow_any_instance_of(RestaurantMenu::Item).to receive(:save).and_return(false)
        put :update, id: item.id, category_id: 123, ingredients: 'Invalid ingredients'
        expect(assigns(:item)).to eq(item)
      end

      it "re-renders the 'edit' template" do
        allow_any_instance_of(RestaurantMenu::Item).to receive(:save).and_return(false)
        put :update, id: item.id, category_id: 123, ingredients: 'Invalid ingredients'
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested item" do
      delete :destroy, id: item.id, category_id: 123
      items = RestaurantMenu::Item.where(category_id: 123)
      expect(items.size).to eql(0)
      expect(flash[:success]).to eql("Item #{item.title} was deleted successfully.")
    end

    it "displays error message" do
      allow_any_instance_of(RestaurantMenu::Item).to receive(:destroy).and_return(false)
      delete :destroy, id: item.id, category_id: 123
      items = RestaurantMenu::Item.where(category_id: 123)
      expect(items.size).to eql(1)
      expect(flash[:error]).to eql("An error happened when deleting the item.")
    end

    it "redirects to the items list" do
      delete :destroy, id: item.id, category_id: 123
      expect(response).to redirect_to('/restaurant_menu/categories/123')
    end
  end
end
