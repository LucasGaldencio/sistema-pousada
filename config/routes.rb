Rails.application.routes.draw do
  # Página Home para usuários autenticados
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  # Página de login para não autenticados
  devise_scope :user do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  # Configurações do Devise, desabilitando o registro público
  devise_for :users, skip: [:registrations]

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

  # Rota para a página Home
  get 'home/index'
end
