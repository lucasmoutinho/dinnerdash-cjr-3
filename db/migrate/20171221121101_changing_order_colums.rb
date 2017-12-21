class ChangingOrderColums < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :quantity, :float
    add_column :orders, :price, :decimal
    add_column :orders, :status, :int
    add_reference :orders, :user
  end
end
