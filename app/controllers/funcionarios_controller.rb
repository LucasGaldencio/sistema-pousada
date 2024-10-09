class FuncionariosController < ApplicationController
  # Garante que o usuário está logado
  before_action :authenticate_user!

  # Verifica se o usuário é administrador para ações restritas
  before_action :authorize_admin, only: [:create, :update, :destroy]

  # Carrega o funcionário apenas para ações que necessitam desse recurso
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: "Funcionário criado com sucesso." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: "Funcionário atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  def destroy
    @funcionario.destroy

    respond_to do |format|
      format.html { redirect_to funcionarios_path, status: :see_other, notice: "Funcionário removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Carrega o funcionário para as ações que necessitam dele
  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  # Apenas administradores podem realizar ações restritas
  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado! Somente administradores podem fazer isso."
    end
  end

  # Definição dos parâmetros permitidos para um funcionário
  def funcionario_params
    params.require(:funcionario).permit(:nome, :cpf, :data_nascimento, :telefone, :email, :cargo)
  end
end
