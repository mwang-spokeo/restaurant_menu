module RestaurantMenu
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
      @categories = Category.all
    end

    def show
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        flash[:success] = 'Category was successfully created.'
        redirect_to @category
      else
        flash[:error] = "Unable to create the new category."
        render :new
      end
    end

    def update
      if @category.update(category_params)
        flash[:success] = 'Category was successfully updated.'
        redirect_to @category
      else
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = "Category #{@category.title} was successfully deleted."
      else
        flash[:error] = 'An error happened when deleting the category.'
      end
      redirect_to categories_path
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.permit(:title)
      end
  end
end
