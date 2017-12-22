class OrderHasMeal < ApplicationRecord
	belongs_to :order
	belongs_to :meal
  after_initialize :init

  validate :meal_present
 	validate :order_present



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

  def init
    self.quantity ||= 0
  end


end
