require 'test_helper'

class DestacadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destacada = destacadas(:one)
  end

  test "should get index" do
    get destacadas_url
    assert_response :success
  end

  test "should get new" do
    get new_destacada_url
    assert_response :success
  end

  test "should create destacada" do
    assert_difference('Destacada.count') do
      post destacadas_url, params: { destacada: { post_id: @destacada.post_id, user_id: @destacada.user_id } }
    end

    assert_redirected_to destacada_url(Destacada.last)
  end

  test "should show destacada" do
    get destacada_url(@destacada)
    assert_response :success
  end

  test "should get edit" do
    get edit_destacada_url(@destacada)
    assert_response :success
  end

  test "should update destacada" do
    patch destacada_url(@destacada), params: { destacada: { post_id: @destacada.post_id, user_id: @destacada.user_id } }
    assert_redirected_to destacada_url(@destacada)
  end

  test "should destroy destacada" do
    assert_difference('Destacada.count', -1) do
      delete destacada_url(@destacada)
    end

    assert_redirected_to destacadas_url
  end
end
