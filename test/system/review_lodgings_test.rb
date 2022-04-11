require "application_system_test_case"

class ReviewLodgingsTest < ApplicationSystemTestCase
  setup do
    @review_lodging = review_lodgings(:one)
  end

  test "visiting the index" do
    visit review_lodgings_url
    assert_selector "h1", text: "Review Lodgings"
  end

  test "creating a Review lodging" do
    visit review_lodgings_url
    click_on "New Review Lodging"

    fill_in "Rating", with: @review_lodging.rating
    fill_in "Text", with: @review_lodging.text
    click_on "Create Review lodging"

    assert_text "Review lodging was successfully created"
    click_on "Back"
  end

  test "updating a Review lodging" do
    visit review_lodgings_url
    click_on "Edit", match: :first

    fill_in "Rating", with: @review_lodging.rating
    fill_in "Text", with: @review_lodging.text
    click_on "Update Review lodging"

    assert_text "Review lodging was successfully updated"
    click_on "Back"
  end

  test "destroying a Review lodging" do
    visit review_lodgings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review lodging was successfully destroyed"
  end
end
