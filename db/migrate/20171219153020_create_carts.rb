class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :Orders do |t|

      t.timestamps
    end
  end
end
