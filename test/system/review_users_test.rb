require "application_system_test_case"

class ReviewUsersTest < ApplicationSystemTestCase
  setup do
    @review_user = review_users(:one)
  end

  test "visiting the index" do
    visit review_users_url
    assert_selector "h1", text: "Review Users"
  end

  test "creating a Review user" do
    visit review_users_url
    click_on "New Review User"

    check "Is a guest" if @review_user.is_a_guest
    fill_in "Rating", with: @review_user.rating
    fill_in "Text", with: @review_user.text
    click_on "Create Review user"

    assert_text "Review user was successfully created"
    click_on "Back"
  end

  test "updating a Review user" do
    visit review_users_url
    click_on "Edit", match: :first

    check "Is a guest" if @review_user.is_a_guest
    fill_in "Rating", with: @review_user.rating
    fill_in "Text", with: @review_user.text
    click_on "Update Review user"

    assert_text "Review user was successfully updated"
    click_on "Back"
  end

  test "destroying a Review user" do
    visit review_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review user was successfully destroyed"
  end
end
