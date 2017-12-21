class OrderHasMeal < ApplicationRecord
	belongs_to :order
	belongs_to :meal

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :meal_present
 	validate :order_present

 	before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      meal.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def meal_present
    if meal.nil?
      errors.add(:meal, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:price] = quantity * unit_price
  end

end
