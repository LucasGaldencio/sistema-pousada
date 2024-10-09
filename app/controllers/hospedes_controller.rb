class HospedesController < ApplicationController
  # Garante que o usuário está logado
  before_action :authenticate_user!

  # Garante que apenas administradores podem criar, editar e remover hóspedes
  before_action :authorize_admin, only: [:create, :update, :destroy]

  # Carrega o hóspede para as ações que precisam desse recurso
  before_action :set_hospede, only: %i[ show edit update destroy ]

  # GET /hospedes
  def index
    @hospedes = Hospede.all
  end

  # GET /hospedes/1
  def show
  end

  # GET /hospedes/new
  def new
    @hospede = Hospede.new
  end

  # GET /hospedes/1/edit
  def edit
  end

  # POST /hospedes
  def create
    @hospede = Hospede.new(hospede_params)

    if @hospede.save
      redirect_to @hospede, notice: "Hóspede foi criado com sucesso."
    else
      flash.now[:alert] = "Erro ao criar o hóspede."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospedes/1
  def update
    if @hospede.update(hospede_params)
      redirect_to @hospede, notice: "Hóspede foi atualizado com sucesso."
    else
      flash.now[:alert] = "Erro ao atualizar o hóspede."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /hospedes/1
  def destroy
    @hospede.destroy
    redirect_to hospedes_path, status: :see_other, notice: "Hóspede foi removido com sucesso."
  end

  private

  # Garante que apenas administradores podem realizar certas ações
  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado! Somente administradores podem fazer isso."
    end
  end

  # Carrega o hóspede com base no ID fornecido
  def set_hospede
    @hospede = Hospede.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to hospedes_path, alert: "Hóspede não encontrado."
  end

  # Define os parâmetros permitidos para um hóspede
  def hospede_params
    params.require(:hospede).permit(:nome, :cpf, :data_nascimento, :telefone, :email)
  end
end
