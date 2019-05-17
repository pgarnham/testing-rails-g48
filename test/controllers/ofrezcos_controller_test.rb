require 'test_helper'

class OfrezcosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ofrezco = ofrezcos(:one)
  end

  test "should get index" do
    get ofrezcos_url
    assert_response :success
  end

  test "should get new" do
    get new_ofrezco_url
    assert_response :success
  end

  test "should create ofrezco" do
    assert_difference('Ofrezco.count') do
      post ofrezcos_url, params: { ofrezco: { course: @ofrezco.course, finish: @ofrezco.finish, start: @ofrezco.start, user_id: @ofrezco.user_id } }
    end

    assert_redirected_to ofrezco_url(Ofrezco.last)
  end

  test "should show ofrezco" do
    get ofrezco_url(@ofrezco)
    assert_response :success
  end

  test "should get edit" do
    get edit_ofrezco_url(@ofrezco)
    assert_response :success
  end

  test "should update ofrezco" do
    patch ofrezco_url(@ofrezco), params: { ofrezco: { course: @ofrezco.course, finish: @ofrezco.finish, start: @ofrezco.start, user_id: @ofrezco.user_id } }
    assert_redirected_to ofrezco_url(@ofrezco)
  end

  test "should destroy ofrezco" do
    assert_difference('Ofrezco.count', -1) do
      delete ofrezco_url(@ofrezco)
    end

    assert_redirected_to ofrezcos_url
  end
end
