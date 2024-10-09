Rails.application.routes.draw do
  devise_for :users
  resources :conta_usuarios
  resources :quartos
  resources :reservas
  resources :funcionarios
  resources :hospedes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
