class AddQuantityToCart < ActiveRecord::Migration[5.1]
  def change
  	add_column :Orders, :quantity, :integer
  end
end
