class DropingOrderTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :orders
  end
end
