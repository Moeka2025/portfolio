require "test_helper"

class SpotControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spot_new_url
    assert_response :success
  end

  test "should get index" do
    get spot_index_url
    assert_response :success
  end

  test "should get show" do
    get spot_show_url
    assert_response :success
  end

  test "should get edit" do
    get spot_edit_url
    assert_response :success
  end
end
