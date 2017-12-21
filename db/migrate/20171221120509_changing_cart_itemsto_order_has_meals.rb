class ChangingCartItemstoOrderHasMeals < ActiveRecord::Migration[5.1]
  def change
    rename_table :order_has_meals, :order_has_meals
  end
end
