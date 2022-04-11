require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  setup do
    @search = searches(:one)
  end

  test "visiting the index" do
    visit searches_url
    assert_selector "h1", text: "Searches"
  end

  test "creating a Search" do
    visit searches_url
    click_on "New Search"

    fill_in "Bathrooms", with: @search.bathrooms
    check "Breakfast included" if @search.breakfast_included
    fill_in "Check in", with: @search.check_in
    fill_in "Check out", with: @search.check_out
    fill_in "Daily fee max", with: @search.daily_fee_max
    fill_in "Daily fee min", with: @search.daily_fee_min
    fill_in "Double bed", with: @search.double_bed
    check "Gym" if @search.gym
    check "Jacuzzi" if @search.jacuzzi
    fill_in "Location", with: @search.location
    check "Parking lot" if @search.parking_lot
    check "Pets accepted" if @search.pets_accepted
    fill_in "Rooms", with: @search.rooms
    fill_in "Single bed", with: @search.single_bed
    check "Smoke free" if @search.smoke_free
    click_on "Create Search"

    assert_text "Search was successfully created"
    click_on "Back"
  end

  test "updating a Search" do
    visit searches_url
    click_on "Edit", match: :first

    fill_in "Bathrooms", with: @search.bathrooms
    check "Breakfast included" if @search.breakfast_included
    fill_in "Check in", with: @search.check_in
    fill_in "Check out", with: @search.check_out
    fill_in "Daily fee max", with: @search.daily_fee_max
    fill_in "Daily fee min", with: @search.daily_fee_min
    fill_in "Double bed", with: @search.double_bed
    check "Gym" if @search.gym
    check "Jacuzzi" if @search.jacuzzi
    fill_in "Location", with: @search.location
    check "Parking lot" if @search.parking_lot
    check "Pets accepted" if @search.pets_accepted
    fill_in "Rooms", with: @search.rooms
    fill_in "Single bed", with: @search.single_bed
    check "Smoke free" if @search.smoke_free
    click_on "Update Search"

    assert_text "Search was successfully updated"
    click_on "Back"
  end

  test "destroying a Search" do
    visit searches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search was successfully destroyed"
  end
end
