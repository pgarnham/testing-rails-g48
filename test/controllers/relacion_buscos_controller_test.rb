require 'test_helper'

class RelacionBuscosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relacion_busco = relacion_buscos(:one)
  end

  test "should get index" do
    get relacion_buscos_url
    assert_response :success
  end

  test "should get new" do
    get new_relacion_busco_url
    assert_response :success
  end

  test "should create relacion_busco" do
    assert_difference('RelacionBusco.count') do
      post relacion_buscos_url, params: { relacion_busco: { busco_id: @relacion_busco.busco_id, user_id: @relacion_busco.user_id } }
    end

    assert_redirected_to relacion_busco_url(RelacionBusco.last)
  end

  test "should show relacion_busco" do
    get relacion_busco_url(@relacion_busco)
    assert_response :success
  end

  test "should get edit" do
    get edit_relacion_busco_url(@relacion_busco)
    assert_response :success
  end

  test "should update relacion_busco" do
    patch relacion_busco_url(@relacion_busco), params: { relacion_busco: { busco_id: @relacion_busco.busco_id, user_id: @relacion_busco.user_id } }
    assert_redirected_to relacion_busco_url(@relacion_busco)
  end

  test "should destroy relacion_busco" do
    assert_difference('RelacionBusco.count', -1) do
      delete relacion_busco_url(@relacion_busco)
    end

    assert_redirected_to relacion_buscos_url
  end
end
