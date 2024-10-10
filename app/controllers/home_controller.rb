class HomeController < ApplicationController
  before_action :authenticate_user!  # Garante que o usuário esteja logado

  def index
    @reservas = Reserva.all || []  # Inicializa como um array vazio se não houver reservas
    @quartos_disponiveis = Quarto.where(status: 'disponível') || []  # Faz o mesmo para quartos disponíveis
  end
end
