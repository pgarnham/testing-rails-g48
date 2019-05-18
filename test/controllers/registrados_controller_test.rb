require 'test_helper'

class RegistradosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registrado = registrados(:one)
  end

  test "should get index" do
    get registrados_url
    assert_response :success
  end

  test "should get new" do
    get new_registrado_url
    assert_response :success
  end

  test "should create registrado" do
    assert_difference('Registrado.count') do
      post registrados_url, params: { registrado: {  } }
    end

    assert_redirected_to registrado_url(Registrado.last)
  end

  test "should show registrado" do
    get registrado_url(@registrado)
    assert_response :success
  end

  test "should get edit" do
    get edit_registrado_url(@registrado)
    assert_response :success
  end

  test "should update registrado" do
    patch registrado_url(@registrado), params: { registrado: {  } }
    assert_redirected_to registrado_url(@registrado)
  end

  test "should destroy registrado" do
    assert_difference('Registrado.count', -1) do
      delete registrado_url(@registrado)
    end

    assert_redirected_to registrados_url
  end
end
