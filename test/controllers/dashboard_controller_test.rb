require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test "get index: is successful" do
    get root_path
    assert_response :success
  end

end
