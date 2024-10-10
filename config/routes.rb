Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  devise_scope :user do
    root to: "devise/sessions#new"  # Define a página de login como a página inicial
  end

  # Rota para a home
  get 'home/index', to: 'home#index', as: 'home'

  # Rotas para o gerenciamento de usuários para administradores
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # Rotas para os demais recursos
  resources :conta_usuarios
  resources :quartos
  resources :reservas
  resources :funcionarios
  resources :hospedes
end
