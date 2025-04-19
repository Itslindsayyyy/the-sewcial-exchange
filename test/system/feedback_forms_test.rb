require "application_system_test_case"

class FeedbackFormsTest < ApplicationSystemTestCase
  setup do
    @feedback_form = feedback_forms(:one)
  end

  test "visiting the index" do
    visit feedback_forms_url
    assert_selector "h1", text: "Feedback forms"
  end

  test "should create feedback form" do
    visit feedback_forms_url
    click_on "New feedback form"

    fill_in "Category", with: @feedback_form.category
    fill_in "Message", with: @feedback_form.message
    fill_in "Submitted at", with: @feedback_form.submitted_at
    fill_in "User", with: @feedback_form.user_id
    click_on "Create Feedback form"

    assert_text "Feedback form was successfully created"
    click_on "Back"
  end

  test "should update Feedback form" do
    visit feedback_form_url(@feedback_form)
    click_on "Edit this feedback form", match: :first

    fill_in "Category", with: @feedback_form.category
    fill_in "Message", with: @feedback_form.message
    fill_in "Submitted at", with: @feedback_form.submitted_at.to_s
    fill_in "User", with: @feedback_form.user_id
    click_on "Update Feedback form"

    assert_text "Feedback form was successfully updated"
    click_on "Back"
  end

  test "should destroy Feedback form" do
    visit feedback_form_url(@feedback_form)
    accept_confirm { click_on "Destroy this feedback form", match: :first }

    assert_text "Feedback form was successfully destroyed"
  end
end
