class ContaUsuariosController < ApplicationController
  before_action :set_conta_usuario, only: %i[ show edit update destroy ]

  # GET /conta_usuarios or /conta_usuarios.json
  def index
    @conta_usuarios = ContaUsuario.all
  end

  # GET /conta_usuarios/1 or /conta_usuarios/1.json
  def show
  end

  # GET /conta_usuarios/new
  def new
    @conta_usuario = ContaUsuario.new
  end

  # GET /conta_usuarios/1/edit
  def edit
  end

  # POST /conta_usuarios or /conta_usuarios.json
  def create
    @conta_usuario = ContaUsuario.new(conta_usuario_params)

    respond_to do |format|
      if @conta_usuario.save
        format.html { redirect_to @conta_usuario, notice: "Conta usuario was successfully created." }
        format.json { render :show, status: :created, location: @conta_usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conta_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_usuarios/1 or /conta_usuarios/1.json
  def update
    respond_to do |format|
      if @conta_usuario.update(conta_usuario_params)
        format.html { redirect_to @conta_usuario, notice: "Conta usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @conta_usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conta_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_usuarios/1 or /conta_usuarios/1.json
  def destroy
    @conta_usuario.destroy

    respond_to do |format|
      format.html { redirect_to conta_usuarios_path, status: :see_other, notice: "Conta usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta_usuario
      @conta_usuario = ContaUsuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conta_usuario_params
      params.require(:conta_usuario).permit(:usuario_id, :username, :senha, :tipo, :status)
    end
end
