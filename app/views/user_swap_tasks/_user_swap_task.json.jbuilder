json.extract! user_swap_task, :id, :user_id, :swap_task_id, :completed, :created_at, :updated_at
json.url user_swap_task_url(user_swap_task, format: :json)
