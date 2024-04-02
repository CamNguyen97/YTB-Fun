require 'test_helper'

class SharesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test "should create movie and redirect to root path when URL is valid" do
    sign_in @user

    valid_url = "https://www.youtube.com/watch?v=VIDEO_ID"

    assert_difference('Movie.count', 1) do
      post shares_url, params: { url: valid_url }
    end

    assert_redirected_to root_path
  end

  test "should not create movie and redirect to shares path when URL is invalid" do
    sign_in @user

    invalid_url = "invalid_url"

    assert_no_difference('Movie.count') do
      post shares_url, params: { url: invalid_url }
    end

    assert_redirected_to shares_path
  end

  test "should redirect to shares path when an error occurs" do
    sign_in @user

    # Stub the extract_video_id method to raise an error
    SharesController.any_instance.stubs(:extract_video_id).raises(StandardError)

    assert_no_difference('Movie.count') do
      post shares_url, params: { url: "https://www.youtube.com/watch?v=VIDEO_ID" }
    end

    assert_redirected_to shares_path
  end
end
