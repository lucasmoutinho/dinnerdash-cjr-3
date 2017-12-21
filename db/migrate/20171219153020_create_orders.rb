class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.column  :price, :decimal
      t.column  :status, :int
      t.references :user
      t.timestamps
    end
  end
end
