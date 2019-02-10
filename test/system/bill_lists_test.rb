require "application_system_test_case"

class BillListsTest < ApplicationSystemTestCase
  setup do
    @bill_list = bill_lists(:one)
  end

  test "visiting the index" do
    visit bill_lists_url
    assert_selector "h1", text: "Bill Lists"
  end

  test "creating a Bill list" do
    visit bill_lists_url
    click_on "New Bill List"

    click_on "Create Bill list"

    assert_text "Bill list was successfully created"
    click_on "Back"
  end

  test "updating a Bill list" do
    visit bill_lists_url
    click_on "Edit", match: :first

    click_on "Update Bill list"

    assert_text "Bill list was successfully updated"
    click_on "Back"
  end

  test "destroying a Bill list" do
    visit bill_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bill list was successfully destroyed"
  end
end
