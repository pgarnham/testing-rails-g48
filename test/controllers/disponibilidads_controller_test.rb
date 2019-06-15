require 'test_helper'

class DisponibilidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disponibilidad = disponibilidads(:one)
  end

  test "should get index" do
    get disponibilidads_url
    assert_response :success
  end

  test "should get new" do
    get new_disponibilidad_url
    assert_response :success
  end

  test "should create disponibilidad" do
    assert_difference('Disponibilidad.count') do
      post disponibilidads_url, params: { disponibilidad: { room_id: @disponibilidad.room_id } }
    end

    assert_redirected_to disponibilidad_url(Disponibilidad.last)
  end

  test "should show disponibilidad" do
    get disponibilidad_url(@disponibilidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_disponibilidad_url(@disponibilidad)
    assert_response :success
  end

  test "should update disponibilidad" do
    patch disponibilidad_url(@disponibilidad), params: { disponibilidad: { room_id: @disponibilidad.room_id } }
    assert_redirected_to disponibilidad_url(@disponibilidad)
  end

  test "should destroy disponibilidad" do
    assert_difference('Disponibilidad.count', -1) do
      delete disponibilidad_url(@disponibilidad)
    end

    assert_redirected_to disponibilidads_url
  end
end
