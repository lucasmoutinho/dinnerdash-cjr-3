Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'
 
  resources :meal_categories do
  	resources :meals
  end
 
  root 'welcome#index'
end
