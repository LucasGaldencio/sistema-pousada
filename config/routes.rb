Rails.application.routes.draw do
  # Configurações do Devise, desabilitando o registro público
  devise_for :users, skip: [:registrations]

  # Rota principal direcionando para a página de login do Devise
  devise_scope :user do
    root to: "devise/sessions#new"  # Define a página de login como a página inicial
  end

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
