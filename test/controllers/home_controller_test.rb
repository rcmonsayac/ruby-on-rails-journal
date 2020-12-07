require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get all today tasks" do
    get root_path
    assert_response :success
  end
end
