class CreateRestaurantMenuItems < ActiveRecord::Migration
  def change
    create_table :restaurant_menu_items do |t|
      t.integer :category_id
      t.string  :title
      t.text    :ingredients
      t.decimal :cost
      t.text    :note

      t.timestamps null: false
    end
  end
end
