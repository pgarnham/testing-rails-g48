require 'test_helper'

class RuidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ruido = ruidos(:one)
  end

  test "should get index" do
    get ruidos_url
    assert_response :success
  end

  test "should get new" do
    get new_ruido_url
    assert_response :success
  end

  test "should create ruido" do
    assert_difference('Ruido.count') do
      post ruidos_url, params: { ruido: { room_id: @ruido.room_id } }
    end

    assert_redirected_to ruido_url(Ruido.last)
  end

  test "should show ruido" do
    get ruido_url(@ruido)
    assert_response :success
  end

  test "should get edit" do
    get edit_ruido_url(@ruido)
    assert_response :success
  end

  test "should update ruido" do
    patch ruido_url(@ruido), params: { ruido: { room_id: @ruido.room_id } }
    assert_redirected_to ruido_url(@ruido)
  end

  test "should destroy ruido" do
    assert_difference('Ruido.count', -1) do
      delete ruido_url(@ruido)
    end

    assert_redirected_to ruidos_url
  end
end
