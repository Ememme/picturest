Rails.application.routes.draw do
  resources :photos
  root 'home#index'
  get 'home/index'
  get 'about', to: 'home#about'
  get 'terms', to: 'home#terms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
