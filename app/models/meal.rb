class Meal < ApplicationRecord

  mount_uploader :picture, PictureUploader
  belongs_to :meal_category
  has_many :order_has_meals
  has_many :orders, :through => :order_has_meals
  after_initialize :init

  def init
    self.available ||= true
    self.meal_category_id ||= MealCategory.find_by(name: "Outros")
    #self.picture ||= "assets/image/default_picture.jpg" ARRUMAR AQUI PARA POR IMAGEM PADRÃO
  end

  #default_scope { where(active: true) } #Garante que pratos inativos ou deletados não sejam adicionados.


end
	