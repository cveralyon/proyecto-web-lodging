require "test_helper"

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lodging = lodgings(:one)
  end

  test "should get index" do
    get lodgings_url
    assert_response :success
  end

  test "should get new" do
    get new_lodging_url
    assert_response :success
  end

  test "should create lodging" do
    assert_difference('Lodging.count') do
      post lodgings_url, params: { lodging: { bathrooms: @lodging.bathrooms, breakfast_included: @lodging.breakfast_included, daily_fee: @lodging.daily_fee, description: @lodging.description, double_bed: @lodging.double_bed, gym: @lodging.gym, jacuzzi: @lodging.jacuzzi, location: @lodging.location, name: @lodging.name, parking_lot: @lodging.parking_lot, pets_accepted: @lodging.pets_accepted, photos: @lodging.photos, rooms: @lodging.rooms, single_bed: @lodging.single_bed, smoke_free: @lodging.smoke_free, video: @lodging.video } }
    end

    assert_redirected_to lodging_url(Lodging.last)
  end

  test "should show lodging" do
    get lodging_url(@lodging)
    assert_response :success
  end

  test "should get edit" do
    get edit_lodging_url(@lodging)
    assert_response :success
  end

  test "should update lodging" do
    patch lodging_url(@lodging), params: { lodging: { bathrooms: @lodging.bathrooms, breakfast_included: @lodging.breakfast_included, daily_fee: @lodging.daily_fee, description: @lodging.description, double_bed: @lodging.double_bed, gym: @lodging.gym, jacuzzi: @lodging.jacuzzi, location: @lodging.location, name: @lodging.name, parking_lot: @lodging.parking_lot, pets_accepted: @lodging.pets_accepted, photos: @lodging.photos, rooms: @lodging.rooms, single_bed: @lodging.single_bed, smoke_free: @lodging.smoke_free, video: @lodging.video } }
    assert_redirected_to lodging_url(@lodging)
  end

  test "should destroy lodging" do
    assert_difference('Lodging.count', -1) do
      delete lodging_url(@lodging)
    end

    assert_redirected_to lodgings_url
  end
end
