class AddAvailableToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :available, :boolean
  end
end
