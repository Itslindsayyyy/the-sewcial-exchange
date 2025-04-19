require "test_helper"

class UserSwapTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_swap_task = user_swap_tasks(:one)
  end

  test "should get index" do
    get user_swap_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_user_swap_task_url
    assert_response :success
  end

  test "should create user_swap_task" do
    assert_difference("UserSwapTask.count") do
      post user_swap_tasks_url, params: { user_swap_task: { completed: @user_swap_task.completed, swap_task_id: @user_swap_task.swap_task_id, user_id: @user_swap_task.user_id } }
    end

    assert_redirected_to user_swap_task_url(UserSwapTask.last)
  end

  test "should show user_swap_task" do
    get user_swap_task_url(@user_swap_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_swap_task_url(@user_swap_task)
    assert_response :success
  end

  test "should update user_swap_task" do
    patch user_swap_task_url(@user_swap_task), params: { user_swap_task: { completed: @user_swap_task.completed, swap_task_id: @user_swap_task.swap_task_id, user_id: @user_swap_task.user_id } }
    assert_redirected_to user_swap_task_url(@user_swap_task)
  end

  test "should destroy user_swap_task" do
    assert_difference("UserSwapTask.count", -1) do
      delete user_swap_task_url(@user_swap_task)
    end

    assert_redirected_to user_swap_tasks_url
  end
end
