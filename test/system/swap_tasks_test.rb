require "application_system_test_case"

class SwapTasksTest < ApplicationSystemTestCase
  setup do
    @swap_task = swap_tasks(:one)
  end

  test "visiting the index" do
    visit swap_tasks_url
    assert_selector "h1", text: "Swap tasks"
  end

  test "should create swap task" do
    visit swap_tasks_url
    click_on "New swap task"

    fill_in "Assigned to user", with: @swap_task.assigned_to_user_id
    check "Completed" if @swap_task.completed
    fill_in "Due date", with: @swap_task.due_date
    fill_in "Swap", with: @swap_task.swap_id
    fill_in "Task name", with: @swap_task.task_name
    click_on "Create Swap task"

    assert_text "Swap task was successfully created"
    click_on "Back"
  end

  test "should update Swap task" do
    visit swap_task_url(@swap_task)
    click_on "Edit this swap task", match: :first

    fill_in "Assigned to user", with: @swap_task.assigned_to_user_id
    check "Completed" if @swap_task.completed
    fill_in "Due date", with: @swap_task.due_date
    fill_in "Swap", with: @swap_task.swap_id
    fill_in "Task name", with: @swap_task.task_name
    click_on "Update Swap task"

    assert_text "Swap task was successfully updated"
    click_on "Back"
  end

  test "should destroy Swap task" do
    visit swap_task_url(@swap_task)
    accept_confirm { click_on "Destroy this swap task", match: :first }

    assert_text "Swap task was successfully destroyed"
  end
end
