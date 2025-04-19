json.extract! group_membership, :id, :swap_group_id, :user_id, :group_role, :created_at, :updated_at
json.url group_membership_url(group_membership, format: :json)
