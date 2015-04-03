class CreateRestaurantMenuCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_menu_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
