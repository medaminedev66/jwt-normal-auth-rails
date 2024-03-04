require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get auth_login_url
    assert_response :success
  end

  test "should get auto_login" do
    get auth_auto_login_url
    assert_response :success
  end

  test "should get user_is_authed" do
    get auth_user_is_authed_url
    assert_response :success
  end
end
