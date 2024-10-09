class ReservasController < ApplicationController
  # Garante que o usuário está logado
  before_action :authenticate_user!

  # Garante que apenas funcionários ou administradores podem criar, atualizar e remover reservas
  before_action :authorize_funcionario_or_admin, only: [:create, :update, :destroy]

  # Carrega a reserva para as ações que necessitam desse recurso
  before_action :set_reserva, only: %i[ show edit update destroy ]

  # GET /reservas
  def index
    @reservas = Reserva.all
  end

  # GET /reservas/1
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: "Reserva criada com sucesso." }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: "Reserva atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  def destroy
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_path, status: :see_other, notice: "Reserva removida com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Método de autorização para garantir que apenas funcionários ou administradores realizem certas ações
  def authorize_funcionario_or_admin
    unless current_user.funcionario? || current_user.admin?
      redirect_to root_path, alert: "Acesso negado! Somente funcionários ou administradores podem fazer isso."
    end
  end

  # Carrega a reserva para as ações necessárias
  def set_reserva
    @reserva = Reserva.find(params[:id])
  end

  # Define os parâmetros permitidos para uma reserva
  def reserva_params
    params.require(:reserva).permit(:data_entrada, :data_saida, :hospede_id, :quarto_id, :status)
  end
end
