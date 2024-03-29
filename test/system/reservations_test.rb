require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Departure date", with: @reservation.departure_date
    fill_in "Entry date", with: @reservation.entry_date
    fill_in "Price", with: @reservation.price
    fill_in "Reserve expiration", with: @reservation.reserve_expiration
    check "Transfer receipt" if @reservation.transfer_receipt
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Departure date", with: @reservation.departure_date
    fill_in "Entry date", with: @reservation.entry_date
    fill_in "Price", with: @reservation.price
    fill_in "Reserve expiration", with: @reservation.reserve_expiration
    check "Transfer receipt" if @reservation.transfer_receipt
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
