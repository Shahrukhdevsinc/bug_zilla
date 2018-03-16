require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get login_signup_url
    assert_response :success
  end

  test "should get create" do
    get login_create_url
    assert_response :success
  end

  test "should get process_login" do
    get login_process_login_url
    assert_response :success
  end

  test "should get logout" do
    get login_logout_url
    assert_response :success
  end

end
