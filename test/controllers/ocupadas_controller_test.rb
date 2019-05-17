require 'test_helper'

class OcupadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocupada = ocupadas(:one)
  end

  test "should get index" do
    get ocupadas_url
    assert_response :success
  end

  test "should get new" do
    get new_ocupada_url
    assert_response :success
  end

  test "should create ocupada" do
    assert_difference('Ocupada.count') do
      post ocupadas_url, params: { ocupada: { description: @ocupada.description, finish: @ocupada.finish, start: @ocupada.start } }
    end

    assert_redirected_to ocupada_url(Ocupada.last)
  end

  test "should show ocupada" do
    get ocupada_url(@ocupada)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocupada_url(@ocupada)
    assert_response :success
  end

  test "should update ocupada" do
    patch ocupada_url(@ocupada), params: { ocupada: { description: @ocupada.description, finish: @ocupada.finish, start: @ocupada.start } }
    assert_redirected_to ocupada_url(@ocupada)
  end

  test "should destroy ocupada" do
    assert_difference('Ocupada.count', -1) do
      delete ocupada_url(@ocupada)
    end

    assert_redirected_to ocupadas_url
  end
end
