require "test_helper"

class SetLanguageControllerTest < ActionDispatch::IntegrationTest
  test "should get english" do
    get set_language_english_url
    assert_response :success
  end

  test "should get vietnam" do
    get set_language_vietnam_url
    assert_response :success
  end

end
