class QuartosController < ApplicationController
  # Garante que o usuário está logado
  before_action :authenticate_user!

  # Apenas administradores podem criar, editar e remover quartos
  before_action :authorize_admin, only: [:create, :update, :destroy]

  # Carrega o quarto para as ações que necessitam dele
  before_action :set_quarto, only: %i[ show edit update destroy ]

  # GET /quartos
  def index
    @quartos = Quarto.all
  end

  # GET /quartos/1
  def show
  end

  # GET /quartos/new
  def new
    @quarto = Quarto.new
  end

  # GET /quartos/1/edit
  def edit
  end

  # POST /quartos
  def create
    @quarto = Quarto.new(quarto_params)

    respond_to do |format|
      if @quarto.save
        format.html { redirect_to @quarto, notice: "Quarto criado com sucesso." }
        format.json { render :show, status: :created, location: @quarto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quartos/1
  def update
    respond_to do |format|
      if @quarto.update(quarto_params)
        format.html { redirect_to @quarto, notice: "Quarto atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @quarto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quartos/1
  def destroy
    @quarto.destroy

    respond_to do |format|
      format.html { redirect_to quartos_path, status: :see_other, notice: "Quarto removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Garante que apenas administradores podem realizar certas ações
  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado! Somente administradores podem fazer isso."
    end
  end

  # Carrega o quarto com base no ID fornecido
  def set_quarto
    @quarto = Quarto.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to quartos_path, alert: "Quarto não encontrado."
  end

  # Define os parâmetros permitidos para um quarto
  def quarto_params
    params.require(:quarto).permit(:numero, :tipo, :preco, :status)
  end
end
