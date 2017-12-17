class AddPictureToMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :picture, :string
  end
end
