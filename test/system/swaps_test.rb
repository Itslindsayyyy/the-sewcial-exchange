require "application_system_test_case"

class SwapsTest < ApplicationSystemTestCase
  setup do
    @swap = swaps(:one)
  end

  test "visiting the index" do
    visit swaps_url
    assert_selector "h1", text: "Swaps"
  end

  test "should create swap" do
    visit swaps_url
    click_on "New swap"

    fill_in "Deadline", with: @swap.deadline
    fill_in "Rules", with: @swap.rules
    fill_in "Status", with: @swap.status
    fill_in "Swap group", with: @swap.swap_group_id
    fill_in "Theme", with: @swap.theme
    fill_in "Title", with: @swap.title
    click_on "Create Swap"

    assert_text "Swap was successfully created"
    click_on "Back"
  end

  test "should update Swap" do
    visit swap_url(@swap)
    click_on "Edit this swap", match: :first

    fill_in "Deadline", with: @swap.deadline.to_s
    fill_in "Rules", with: @swap.rules
    fill_in "Status", with: @swap.status
    fill_in "Swap group", with: @swap.swap_group_id
    fill_in "Theme", with: @swap.theme
    fill_in "Title", with: @swap.title
    click_on "Update Swap"

    assert_text "Swap was successfully updated"
    click_on "Back"
  end

  test "should destroy Swap" do
    visit swap_url(@swap)
    accept_confirm { click_on "Destroy this swap", match: :first }

    assert_text "Swap was successfully destroyed"
  end
end
