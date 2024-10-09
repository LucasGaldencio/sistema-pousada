class ContaUsuariosController < ApplicationController
  # Garante que o usuário está logado
  before_action :authenticate_user!

  # Somente administradores podem criar, editar e excluir contas de usuários
  before_action :authorize_admin, only: [:create, :update, :destroy]

  # Carrega a conta de usuário para as ações que necessitam dela
  before_action :set_conta_usuario, only: %i[ show edit update destroy ]

  # GET /conta_usuarios
  def index
    @conta_usuarios = ContaUsuario.all
  end

  # GET /conta_usuarios/1
  def show
  end

  # GET /conta_usuarios/new
  def new
    @conta_usuario = ContaUsuario.new
  end

  # GET /conta_usuarios/1/edit
  def edit
  end

  # POST /conta_usuarios
  def create
    @conta_usuario = ContaUsuario.new(conta_usuario_params)

    respond_to do |format|
      if @conta_usuario.save
        format.html { redirect_to @conta_usuario, notice: "Conta de usuário criada com sucesso." }
        format.json { render :show, status: :created, location: @conta_usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conta_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_usuarios/1
  def update
    respond_to do |format|
      if @conta_usuario.update(conta_usuario_params)
        format.html { redirect_to @conta_usuario, notice: "Conta de usuário atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @conta_usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conta_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_usuarios/1
  def destroy
    @conta_usuario.destroy

    respond_to do |format|
      format.html { redirect_to conta_usuarios_path, status: :see_other, notice: "Conta de usuário removida com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Garante que apenas administradores podem realizar certas ações
  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado! Somente administradores podem realizar essa ação."
    end
  end

  # Carrega a conta de usuário com base no ID fornecido
  def set_conta_usuario
    @conta_usuario = ContaUsuario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to conta_usuarios_path, alert: "Conta de usuário não encontrada."
  end

  # Define os parâmetros permitidos para uma conta de usuário
  def conta_usuario_params
    params.require(:conta_usuario).permit(:usuario_id, :username, :senha, :tipo, :status)
  end
end
