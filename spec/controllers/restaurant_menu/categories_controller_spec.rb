require 'spec_helper'

describe RestaurantMenu::CategoriesController do
  let!(:category){FactoryGirl.create(:restaurant_menu_category)}

  describe "GET index" do
    it "assigns all categories as @categories" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET show" do
    it "assigns the requested category as @category" do
      get :show, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      get :new
      expect(assigns(:category)).to be_a_new(RestaurantMenu::Category)
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      get :edit, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Category" do
        post :create, title: 'Test Test'
        categories = RestaurantMenu::Category.all
        expect(categories.size).to eql(2)
      end

      it "assigns a newly created category as @category" do
        post :create, title: 'Test Test'
        expect(assigns(:category)).to be_a(RestaurantMenu::Category)
      end

      it "redirects to the created category" do
        post :create, title: 'Test Test'
        expect(response).to redirect_to(RestaurantMenu::Category.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        allow_any_instance_of(RestaurantMenu::Category).to receive(:save).and_return(false)
        post :create, title: 'Something Invalid'
        expect(assigns(:category)).to be_a_new(RestaurantMenu::Category)
      end

      it "renders the 'new' template" do
        allow_any_instance_of(RestaurantMenu::Category).to receive(:save).and_return(false)
        post :create, title: 'Something Invalid'
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested category" do
        put :update, id: category.id, title: 'New Title'
        category.reload
        expect(category.title).to eql('New Title')
      end

      it "assigns the requested category as @category" do
        put :update, id: category.id, title: 'New Title'
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the category" do
        put :update, id: category.id, title: 'New Title'
        expect(response).to redirect_to(category)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        allow_any_instance_of(RestaurantMenu::Category).to receive(:save).and_return(false)
        put :update, id: category.id, title: 'Something Invalid'
        expect(assigns(:category)).to eq(category)
      end

      it "renders the 'edit' template" do
        allow_any_instance_of(RestaurantMenu::Category).to receive(:save).and_return(false)
        put :update, id: category.id, title: 'New Title'
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested category and show success notice" do
      delete :destroy, id: category.id
      categories = RestaurantMenu::Category.all
      expect(categories.size).to eql(0)
      expect(flash[:success]).to eql("Category #{category.title} was successfully deleted.")
    end

    it "displays error message" do
      allow_any_instance_of(RestaurantMenu::Category).to receive(:destroy).and_return(false)
      delete :destroy, id: category.id
      categories = RestaurantMenu::Category.all
      expect(categories.size).to eql(1)
      expect(flash[:error]).to eql("An error happened when deleting the category.")
    end

    it "redirects to the categories list" do
      delete :destroy, id: category.id
      expect(response).to redirect_to('/restaurant_menu/categories')
      expect(flash[:success]).to eql("Category #{category.title} was successfully deleted.")
    end
  end
end
