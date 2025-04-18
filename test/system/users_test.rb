require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Address line1", with: @user.address_line1
    fill_in "Address line2", with: @user.address_line2
    fill_in "City", with: @user.city
    fill_in "Display name", with: @user.display_name
    fill_in "Email", with: @user.email
    fill_in "Facebook url", with: @user.facebook_url
    fill_in "First name", with: @user.first_name
    fill_in "Instagram url", with: @user.instagram_url
    fill_in "Last name", with: @user.last_name
    fill_in "State", with: @user.state
    fill_in "Zip", with: @user.zip
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Address line1", with: @user.address_line1
    fill_in "Address line2", with: @user.address_line2
    fill_in "City", with: @user.city
    fill_in "Display name", with: @user.display_name
    fill_in "Email", with: @user.email
    fill_in "Facebook url", with: @user.facebook_url
    fill_in "First name", with: @user.first_name
    fill_in "Instagram url", with: @user.instagram_url
    fill_in "Last name", with: @user.last_name
    fill_in "State", with: @user.state
    fill_in "Zip", with: @user.zip
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    accept_confirm { click_on "Destroy this user", match: :first }

    assert_text "User was successfully destroyed"
  end
end
