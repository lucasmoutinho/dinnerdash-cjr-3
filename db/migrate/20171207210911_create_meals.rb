class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.boolean :available
      t.timestamps
    end
  end
end
