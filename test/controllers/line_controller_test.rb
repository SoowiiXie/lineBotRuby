require 'test_helper'

class LineControllerTest < ActionDispatch::IntegrationTest
  test "should get webhook" do
    get line_webhook_url
    assert_response :success
  end

end
