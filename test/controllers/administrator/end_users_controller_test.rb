require 'test_helper'

class Administrator::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_end_users_index_url
    assert_response :success
  end

  test "should get show" do
    get administrator_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get administrator_end_users_edit_url
    assert_response :success
  end

end
