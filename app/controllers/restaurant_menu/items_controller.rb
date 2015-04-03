module RestaurantMenu
  class ItemsController < ApplicationController
    before_action :set_item, only: [:edit, :update, :destroy]

    def new
      @item = Item.new
      @item.category_id = params[:category_id]
    end

    def edit
    end

    def create
      @item = Item.new(item_params)

      if @item.save
        flash[:success] = 'Item was successfully created.'
        redirect_to category_path(params[:category_id])
      else
        flash[:error] = "Unable to create the new item."
        render :new
      end
    end

    def update
      if @item.update(item_params)
        flash[:success] = 'Item was successfully updated.'
        redirect_to category_path(params[:category_id])
      else
        render :edit
      end
    end

    def destroy
      if @item.destroy
        flash[:success] = "Item #{@item.title} was deleted successfully."
      else
        flash[:error] = "An error happened when deleting the item."
      end
      redirect_to category_path(@item.category_id)
    end

    private
      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.permit(:category_id, :title, :ingredients, :cost, :note)
      end
  end
end
