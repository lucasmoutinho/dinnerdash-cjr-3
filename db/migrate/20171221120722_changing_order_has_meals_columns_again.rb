class ChangingOrderHasMealsColumnsAgain < ActiveRecord::Migration[5.1]
  def change
    change_column :order_has_meals, :price, :decimal
    add_reference :order_has_meals, :meal, foreign_key: true
    add_reference :order_has_meals, :order, foreign_key: true
  end
end
