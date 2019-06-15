require 'test_helper'

class SolModeradorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sol_moderador = sol_moderadors(:one)
  end

  test "should get index" do
    get sol_moderadors_url
    assert_response :success
  end

  test "should get new" do
    get new_sol_moderador_url
    assert_response :success
  end

  test "should create sol_moderador" do
    assert_difference('SolModerador.count') do
      post sol_moderadors_url, params: { sol_moderador: { user_id: @sol_moderador.user_id } }
    end

    assert_redirected_to sol_moderador_url(SolModerador.last)
  end

  test "should show sol_moderador" do
    get sol_moderador_url(@sol_moderador)
    assert_response :success
  end

  test "should get edit" do
    get edit_sol_moderador_url(@sol_moderador)
    assert_response :success
  end

  test "should update sol_moderador" do
    patch sol_moderador_url(@sol_moderador), params: { sol_moderador: { user_id: @sol_moderador.user_id } }
    assert_redirected_to sol_moderador_url(@sol_moderador)
  end

  test "should destroy sol_moderador" do
    assert_difference('SolModerador.count', -1) do
      delete sol_moderador_url(@sol_moderador)
    end

    assert_redirected_to sol_moderadors_url
  end
end
