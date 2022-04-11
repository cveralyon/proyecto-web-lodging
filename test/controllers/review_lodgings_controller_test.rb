require "test_helper"

class ReviewLodgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_lodging = review_lodgings(:one)
  end

  test "should get index" do
    get review_lodgings_url
    assert_response :success
  end

  test "should get new" do
    get new_review_lodging_url
    assert_response :success
  end

  test "should create review_lodging" do
    assert_difference('ReviewLodging.count') do
      post review_lodgings_url, params: { review_lodging: { rating: @review_lodging.rating, text: @review_lodging.text } }
    end

    assert_redirected_to review_lodging_url(ReviewLodging.last)
  end

  test "should show review_lodging" do
    get review_lodging_url(@review_lodging)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_lodging_url(@review_lodging)
    assert_response :success
  end

  test "should update review_lodging" do
    patch review_lodging_url(@review_lodging), params: { review_lodging: { rating: @review_lodging.rating, text: @review_lodging.text } }
    assert_redirected_to review_lodging_url(@review_lodging)
  end

  test "should destroy review_lodging" do
    assert_difference('ReviewLodging.count', -1) do
      delete review_lodging_url(@review_lodging)
    end

    assert_redirected_to review_lodgings_url
  end
end
