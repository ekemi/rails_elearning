Rails.application.routes.draw do

  resources :students
  devise_for :users
  # root 'students#index'#devise require a root route
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
