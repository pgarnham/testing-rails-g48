require 'test_helper'

class EnchuvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enchufe = enchuves(:one)
  end

  test "should get index" do
    get enchuves_url
    assert_response :success
  end

  test "should get new" do
    get new_enchufe_url
    assert_response :success
  end

  test "should create enchufe" do
    assert_difference('Enchufe.count') do
      post enchuves_url, params: { enchufe: { room_id: @enchufe.room_id } }
    end

    assert_redirected_to enchufe_url(Enchufe.last)
  end

  test "should show enchufe" do
    get enchufe_url(@enchufe)
    assert_response :success
  end

  test "should get edit" do
    get edit_enchufe_url(@enchufe)
    assert_response :success
  end

  test "should update enchufe" do
    patch enchufe_url(@enchufe), params: { enchufe: { room_id: @enchufe.room_id } }
    assert_redirected_to enchufe_url(@enchufe)
  end

  test "should destroy enchufe" do
    assert_difference('Enchufe.count', -1) do
      delete enchufe_url(@enchufe)
    end

    assert_redirected_to enchuves_url
  end
end
