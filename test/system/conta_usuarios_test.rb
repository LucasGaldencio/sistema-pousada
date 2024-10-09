require "application_system_test_case"

class ContaUsuariosTest < ApplicationSystemTestCase
  setup do
    @conta_usuario = conta_usuarios(:one)
  end

  test "visiting the index" do
    visit conta_usuarios_url
    assert_selector "h1", text: "Conta usuarios"
  end

  test "should create conta usuario" do
    visit conta_usuarios_url
    click_on "New conta usuario"

    fill_in "Senha", with: @conta_usuario.senha
    fill_in "Status", with: @conta_usuario.status
    fill_in "Tipo", with: @conta_usuario.tipo
    fill_in "Username", with: @conta_usuario.username
    fill_in "Usuario", with: @conta_usuario.usuario_id
    click_on "Create Conta usuario"

    assert_text "Conta usuario was successfully created"
    click_on "Back"
  end

  test "should update Conta usuario" do
    visit conta_usuario_url(@conta_usuario)
    click_on "Edit this conta usuario", match: :first

    fill_in "Senha", with: @conta_usuario.senha
    fill_in "Status", with: @conta_usuario.status
    fill_in "Tipo", with: @conta_usuario.tipo
    fill_in "Username", with: @conta_usuario.username
    fill_in "Usuario", with: @conta_usuario.usuario_id
    click_on "Update Conta usuario"

    assert_text "Conta usuario was successfully updated"
    click_on "Back"
  end

  test "should destroy Conta usuario" do
    visit conta_usuario_url(@conta_usuario)
    click_on "Destroy this conta usuario", match: :first

    assert_text "Conta usuario was successfully destroyed"
  end
end
