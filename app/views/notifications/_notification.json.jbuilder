json.extract! notification, :id, :user_id, :message, :read, :notification_type, :created_at, :updated_at
json.url notification_url(notification, format: :json)
