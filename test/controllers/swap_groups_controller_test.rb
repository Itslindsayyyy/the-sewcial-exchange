require "test_helper"

class SwapGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swap_group = swap_groups(:one)
  end

  test "should get index" do
    get swap_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_swap_group_url
    assert_response :success
  end

  test "should create swap_group" do
    assert_difference("SwapGroup.count") do
      post swap_groups_url, params: { swap_group: { created_by_id: @swap_group.created_by_id, description: @swap_group.description, name: @swap_group.name } }
    end

    assert_redirected_to swap_group_url(SwapGroup.last)
  end

  test "should show swap_group" do
    get swap_group_url(@swap_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_swap_group_url(@swap_group)
    assert_response :success
  end

  test "should update swap_group" do
    patch swap_group_url(@swap_group), params: { swap_group: { created_by_id: @swap_group.created_by_id, description: @swap_group.description, name: @swap_group.name } }
    assert_redirected_to swap_group_url(@swap_group)
  end

  test "should destroy swap_group" do
    assert_difference("SwapGroup.count", -1) do
      delete swap_group_url(@swap_group)
    end

    assert_redirected_to swap_groups_url
  end
end
