require "test_helper"

class SwapTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swap_task = swap_tasks(:one)
  end

  test "should get index" do
    get swap_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_swap_task_url
    assert_response :success
  end

  test "should create swap_task" do
    assert_difference("SwapTask.count") do
      post swap_tasks_url, params: { swap_task: { assigned_to_user_id: @swap_task.assigned_to_user_id, completed: @swap_task.completed, due_date: @swap_task.due_date, swap_id: @swap_task.swap_id, task_name: @swap_task.task_name } }
    end

    assert_redirected_to swap_task_url(SwapTask.last)
  end

  test "should show swap_task" do
    get swap_task_url(@swap_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_swap_task_url(@swap_task)
    assert_response :success
  end

  test "should update swap_task" do
    patch swap_task_url(@swap_task), params: { swap_task: { assigned_to_user_id: @swap_task.assigned_to_user_id, completed: @swap_task.completed, due_date: @swap_task.due_date, swap_id: @swap_task.swap_id, task_name: @swap_task.task_name } }
    assert_redirected_to swap_task_url(@swap_task)
  end

  test "should destroy swap_task" do
    assert_difference("SwapTask.count", -1) do
      delete swap_task_url(@swap_task)
    end

    assert_redirected_to swap_tasks_url
  end
end
