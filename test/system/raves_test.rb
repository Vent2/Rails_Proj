require "application_system_test_case"

class RavesTest < ApplicationSystemTestCase
  setup do
    @rafe = raves(:one)
  end

  test "visiting the index" do
    visit raves_url
    assert_selector "h1", text: "Raves"
  end

  test "creating a Rave" do
    visit raves_url
    click_on "New Rave"

    fill_in "Date", with: @rafe.date
    fill_in "Name", with: @rafe.name
    fill_in "Price", with: @rafe.price
    click_on "Create Rave"

    assert_text "Rave was successfully created"
    click_on "Back"
  end

  test "updating a Rave" do
    visit raves_url
    click_on "Edit", match: :first

    fill_in "Date", with: @rafe.date
    fill_in "Name", with: @rafe.name
    fill_in "Price", with: @rafe.price
    click_on "Update Rave"

    assert_text "Rave was successfully updated"
    click_on "Back"
  end

  test "destroying a Rave" do
    visit raves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rave was successfully destroyed"
  end
end
