require "application_system_test_case"

class UserSwapTasksTest < ApplicationSystemTestCase
  setup do
    @user_swap_task = user_swap_tasks(:one)
  end

  test "visiting the index" do
    visit user_swap_tasks_url
    assert_selector "h1", text: "User swap tasks"
  end

  test "should create user swap task" do
    visit user_swap_tasks_url
    click_on "New user swap task"

    check "Completed" if @user_swap_task.completed
    fill_in "Swap task", with: @user_swap_task.swap_task_id
    fill_in "User", with: @user_swap_task.user_id
    click_on "Create User swap task"

    assert_text "User swap task was successfully created"
    click_on "Back"
  end

  test "should update User swap task" do
    visit user_swap_task_url(@user_swap_task)
    click_on "Edit this user swap task", match: :first

    check "Completed" if @user_swap_task.completed
    fill_in "Swap task", with: @user_swap_task.swap_task_id
    fill_in "User", with: @user_swap_task.user_id
    click_on "Update User swap task"

    assert_text "User swap task was successfully updated"
    click_on "Back"
  end

  test "should destroy User swap task" do
    visit user_swap_task_url(@user_swap_task)
    accept_confirm { click_on "Destroy this user swap task", match: :first }

    assert_text "User swap task was successfully destroyed"
  end
end
