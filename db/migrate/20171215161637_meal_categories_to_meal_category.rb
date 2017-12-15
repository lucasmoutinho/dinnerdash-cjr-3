class MealCategoriesToMealCategory < ActiveRecord::Migration[5.0]
  change_table(:meals) do |t|
  	t.remove :meal_categories_id
  	t.references :meal_category
  end
end
