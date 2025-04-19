json.extract! feedback_form, :id, :user_id, :category, :message, :submitted_at, :created_at, :updated_at
json.url feedback_form_url(feedback_form, format: :json)
