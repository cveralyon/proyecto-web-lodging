require "application_system_test_case"

class LodgingsTest < ApplicationSystemTestCase
  setup do
    @lodging = lodgings(:one)
  end

  test "visiting the index" do
    visit lodgings_url
    assert_selector "h1", text: "Lodgings"
  end

  test "creating a Lodging" do
    visit lodgings_url
    click_on "New Lodging"

    fill_in "Bathrooms", with: @lodging.bathrooms
    check "Breakfast included" if @lodging.breakfast_included
    fill_in "Daily fee", with: @lodging.daily_fee
    fill_in "Description", with: @lodging.description
    fill_in "Double bed", with: @lodging.double_bed
    check "Gym" if @lodging.gym
    check "Jacuzzi" if @lodging.jacuzzi
    fill_in "Location", with: @lodging.location
    fill_in "Name", with: @lodging.name
    check "Parking lot" if @lodging.parking_lot
    check "Pets accepted" if @lodging.pets_accepted
    fill_in "Photos", with: @lodging.photos
    fill_in "Rooms", with: @lodging.rooms
    fill_in "Single bed", with: @lodging.single_bed
    check "Smoke free" if @lodging.smoke_free
    fill_in "Video", with: @lodging.video
    click_on "Create Lodging"

    assert_text "Lodging was successfully created"
    click_on "Back"
  end

  test "updating a Lodging" do
    visit lodgings_url
    click_on "Edit", match: :first

    fill_in "Bathrooms", with: @lodging.bathrooms
    check "Breakfast included" if @lodging.breakfast_included
    fill_in "Daily fee", with: @lodging.daily_fee
    fill_in "Description", with: @lodging.description
    fill_in "Double bed", with: @lodging.double_bed
    check "Gym" if @lodging.gym
    check "Jacuzzi" if @lodging.jacuzzi
    fill_in "Location", with: @lodging.location
    fill_in "Name", with: @lodging.name
    check "Parking lot" if @lodging.parking_lot
    check "Pets accepted" if @lodging.pets_accepted
    fill_in "Photos", with: @lodging.photos
    fill_in "Rooms", with: @lodging.rooms
    fill_in "Single bed", with: @lodging.single_bed
    check "Smoke free" if @lodging.smoke_free
    fill_in "Video", with: @lodging.video
    click_on "Update Lodging"

    assert_text "Lodging was successfully updated"
    click_on "Back"
  end

  test "destroying a Lodging" do
    visit lodgings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lodging was successfully destroyed"
  end
end
