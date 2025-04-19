json.extract! swap_task, :id, :swap_id, :task_name, :due_date, :assigned_to_user_id, :completed, :created_at, :updated_at
json.url swap_task_url(swap_task, format: :json)
