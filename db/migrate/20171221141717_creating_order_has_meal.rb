class CreatingOrderHasMeal < ActiveRecord::Migration[5.1]

  def change
    create_table :order_has_meals do |t|
        t.column :price, :decimal
        t.column :quantity, :integer
        t.column :created_at, :datetime
        t.references :meal, foreign_key: true
        t.references :order, foreign_key: true
    end
  end
end
