require 'test_helper'

class LPsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get l_ps_home_url
    assert_response :success
  end

end
