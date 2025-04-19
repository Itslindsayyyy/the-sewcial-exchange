require "application_system_test_case"

class SwapGroupsTest < ApplicationSystemTestCase
  setup do
    @swap_group = swap_groups(:one)
  end

  test "visiting the index" do
    visit swap_groups_url
    assert_selector "h1", text: "Swap groups"
  end

  test "should create swap group" do
    visit swap_groups_url
    click_on "New swap group"

    fill_in "Created by", with: @swap_group.created_by_id
    fill_in "Description", with: @swap_group.description
    fill_in "Name", with: @swap_group.name
    click_on "Create Swap group"

    assert_text "Swap group was successfully created"
    click_on "Back"
  end

  test "should update Swap group" do
    visit swap_group_url(@swap_group)
    click_on "Edit this swap group", match: :first

    fill_in "Created by", with: @swap_group.created_by_id
    fill_in "Description", with: @swap_group.description
    fill_in "Name", with: @swap_group.name
    click_on "Update Swap group"

    assert_text "Swap group was successfully updated"
    click_on "Back"
  end

  test "should destroy Swap group" do
    visit swap_group_url(@swap_group)
    accept_confirm { click_on "Destroy this swap group", match: :first }

    assert_text "Swap group was successfully destroyed"
  end
end
