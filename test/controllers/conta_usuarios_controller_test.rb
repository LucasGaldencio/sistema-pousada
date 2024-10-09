require "test_helper"

class ContaUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conta_usuario = conta_usuarios(:one)
  end

  test "should get index" do
    get conta_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_conta_usuario_url
    assert_response :success
  end

  test "should create conta_usuario" do
    assert_difference("ContaUsuario.count") do
      post conta_usuarios_url, params: { conta_usuario: { senha: @conta_usuario.senha, status: @conta_usuario.status, tipo: @conta_usuario.tipo, username: @conta_usuario.username, usuario_id: @conta_usuario.usuario_id } }
    end

    assert_redirected_to conta_usuario_url(ContaUsuario.last)
  end

  test "should show conta_usuario" do
    get conta_usuario_url(@conta_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_conta_usuario_url(@conta_usuario)
    assert_response :success
  end

  test "should update conta_usuario" do
    patch conta_usuario_url(@conta_usuario), params: { conta_usuario: { senha: @conta_usuario.senha, status: @conta_usuario.status, tipo: @conta_usuario.tipo, username: @conta_usuario.username, usuario_id: @conta_usuario.usuario_id } }
    assert_redirected_to conta_usuario_url(@conta_usuario)
  end

  test "should destroy conta_usuario" do
    assert_difference("ContaUsuario.count", -1) do
      delete conta_usuario_url(@conta_usuario)
    end

    assert_redirected_to conta_usuarios_url
  end
end
