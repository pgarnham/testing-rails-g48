require 'test_helper'

class SalitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salitum = salita(:one)
  end

  test "should get index" do
    get salita_url
    assert_response :success
  end

  test "should get new" do
    get new_salitum_url
    assert_response :success
  end

  test "should create salitum" do
    assert_difference('Salitum.count') do
      post salita_url, params: { salitum: {  } }
    end

    assert_redirected_to salitum_url(Salitum.last)
  end

  test "should show salitum" do
    get salitum_url(@salitum)
    assert_response :success
  end

  test "should get edit" do
    get edit_salitum_url(@salitum)
    assert_response :success
  end

  test "should update salitum" do
    patch salitum_url(@salitum), params: { salitum: {  } }
    assert_redirected_to salitum_url(@salitum)
  end

  test "should destroy salitum" do
    assert_difference('Salitum.count', -1) do
      delete salitum_url(@salitum)
    end

    assert_redirected_to salita_url
  end
end
