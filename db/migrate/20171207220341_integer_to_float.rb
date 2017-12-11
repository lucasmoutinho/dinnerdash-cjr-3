class IntegerToFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column :meals, :price, :real
  end
end
