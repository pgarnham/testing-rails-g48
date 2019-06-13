require 'test_helper'

class SolAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sol_admin = sol_admins(:one)
  end

  test "should get index" do
    get sol_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_sol_admin_url
    assert_response :success
  end

  test "should create sol_admin" do
    assert_difference('SolAdmin.count') do
      post sol_admins_url, params: { sol_admin: { user_id: @sol_admin.user_id } }
    end

    assert_redirected_to sol_admin_url(SolAdmin.last)
  end

  test "should show sol_admin" do
    get sol_admin_url(@sol_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_sol_admin_url(@sol_admin)
    assert_response :success
  end

  test "should update sol_admin" do
    patch sol_admin_url(@sol_admin), params: { sol_admin: { user_id: @sol_admin.user_id } }
    assert_redirected_to sol_admin_url(@sol_admin)
  end

  test "should destroy sol_admin" do
    assert_difference('SolAdmin.count', -1) do
      delete sol_admin_url(@sol_admin)
    end

    assert_redirected_to sol_admins_url
  end
end
