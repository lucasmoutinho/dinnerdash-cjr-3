Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'meal_categories/index'
 
  resources :meal_categories do
  	resources :meals
  end
 
  root 'meal_categories#index'
end
