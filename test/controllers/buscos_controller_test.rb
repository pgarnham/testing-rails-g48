require 'test_helper'

class BuscosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busco = buscos(:one)
  end

  test "should get index" do
    get buscos_url
    assert_response :success
  end

  test "should get new" do
    get new_busco_url
    assert_response :success
  end

  test "should create busco" do
    assert_difference('Busco.count') do
      post buscos_url, params: { busco: { course: @busco.course, finish: @busco.finish, start: @busco.start } }
    end

    assert_redirected_to busco_url(Busco.last)
  end

  test "should show busco" do
    get busco_url(@busco)
    assert_response :success
  end

  test "should get edit" do
    get edit_busco_url(@busco)
    assert_response :success
  end

  test "should update busco" do
    patch busco_url(@busco), params: { busco: { course: @busco.course, finish: @busco.finish, start: @busco.start } }
    assert_redirected_to busco_url(@busco)
  end

  test "should destroy busco" do
    assert_difference('Busco.count', -1) do
      delete busco_url(@busco)
    end

    assert_redirected_to buscos_url
  end
end
