class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :meal

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validate :meal_present
 	validate :cart_present

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

  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a valid cart.")
    end
  end

  def finalize
    self[:price] = quantity * unit_price
  end

end
