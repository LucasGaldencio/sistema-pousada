class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @funcionarios = Funcionario.all
      @reservas = Reserva.all
      @quartos = Quarto.all
    elsif current_user.funcionario?
      @reservas = current_user.reservas
      @quartos = Quarto.where(status: 'disponível')
    end
  end
end
