require "test_helper"

class ReviewUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_user = review_users(:one)
  end

  test "should get index" do
    get review_users_url
    assert_response :success
  end

  test "should get new" do
    get new_review_user_url
    assert_response :success
  end

  test "should create review_user" do
    assert_difference('ReviewUser.count') do
      post review_users_url, params: { review_user: { is_a_guest: @review_user.is_a_guest, rating: @review_user.rating, text: @review_user.text } }
    end

    assert_redirected_to review_user_url(ReviewUser.last)
  end

  test "should show review_user" do
    get review_user_url(@review_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_user_url(@review_user)
    assert_response :success
  end

  test "should update review_user" do
    patch review_user_url(@review_user), params: { review_user: { is_a_guest: @review_user.is_a_guest, rating: @review_user.rating, text: @review_user.text } }
    assert_redirected_to review_user_url(@review_user)
  end

  test "should destroy review_user" do
    assert_difference('ReviewUser.count', -1) do
      delete review_user_url(@review_user)
    end

    assert_redirected_to review_users_url
  end
end
