require 'test_helper'

class ContenidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contenido = contenidos(:one)
  end

  test "should get index" do
    get contenidos_url
    assert_response :success
  end

  test "should get new" do
    get new_contenido_url
    assert_response :success
  end

  test "should create contenido" do
    assert_difference('Contenido.count') do
      post contenidos_url, params: { contenido: {  } }
    end

    assert_redirected_to contenido_url(Contenido.last)
  end

  test "should show contenido" do
    get contenido_url(@contenido)
    assert_response :success
  end

  test "should get edit" do
    get edit_contenido_url(@contenido)
    assert_response :success
  end

  test "should update contenido" do
    patch contenido_url(@contenido), params: { contenido: {  } }
    assert_redirected_to contenido_url(@contenido)
  end

  test "should destroy contenido" do
    assert_difference('Contenido.count', -1) do
      delete contenido_url(@contenido)
    end

    assert_redirected_to contenidos_url
  end
end
