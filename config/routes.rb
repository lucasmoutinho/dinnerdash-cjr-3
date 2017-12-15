Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  resources :meals
  get 'home/index'

 	devise_for :users
	root "home#index"

  get 'meal_categories/index'
 
  resources :meal_categories do
  	resources :meals
  end
 
end
