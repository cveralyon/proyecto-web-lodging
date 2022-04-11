require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search = searches(:one)
  end

  test "should get index" do
    get searches_url
    assert_response :success
  end

  test "should get new" do
    get new_search_url
    assert_response :success
  end

  test "should create search" do
    assert_difference('Search.count') do
      post searches_url, params: { search: { bathrooms: @search.bathrooms, breakfast_included: @search.breakfast_included, check_in: @search.check_in, check_out: @search.check_out, daily_fee_max: @search.daily_fee_max, daily_fee_min: @search.daily_fee_min, double_bed: @search.double_bed, gym: @search.gym, jacuzzi: @search.jacuzzi, location: @search.location, parking_lot: @search.parking_lot, pets_accepted: @search.pets_accepted, rooms: @search.rooms, single_bed: @search.single_bed, smoke_free: @search.smoke_free } }
    end

    assert_redirected_to search_url(Search.last)
  end

  test "should show search" do
    get search_url(@search)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_url(@search)
    assert_response :success
  end

  test "should update search" do
    patch search_url(@search), params: { search: { bathrooms: @search.bathrooms, breakfast_included: @search.breakfast_included, check_in: @search.check_in, check_out: @search.check_out, daily_fee_max: @search.daily_fee_max, daily_fee_min: @search.daily_fee_min, double_bed: @search.double_bed, gym: @search.gym, jacuzzi: @search.jacuzzi, location: @search.location, parking_lot: @search.parking_lot, pets_accepted: @search.pets_accepted, rooms: @search.rooms, single_bed: @search.single_bed, smoke_free: @search.smoke_free } }
    assert_redirected_to search_url(@search)
  end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete search_url(@search)
    end

    assert_redirected_to searches_url
  end
end
