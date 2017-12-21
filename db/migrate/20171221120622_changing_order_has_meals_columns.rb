class ChangingOrderHasMealsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_has_meals, :meal_id, :integer
    remove_column :order_has_meals, :cart_id, :integer
  end
end
