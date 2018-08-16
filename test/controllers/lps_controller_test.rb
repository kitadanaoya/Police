require 'test_helper'

class LpsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get lps_home_url
    assert_response :success
  end

end
