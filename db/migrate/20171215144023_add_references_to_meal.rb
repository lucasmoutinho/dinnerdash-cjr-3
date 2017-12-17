class AddReferencesToMeal < ActiveRecord::Migration[5.0]
  change_table(:meals) do |t|
  	t.references :meal_categories, foreign_key: true
  end
end
