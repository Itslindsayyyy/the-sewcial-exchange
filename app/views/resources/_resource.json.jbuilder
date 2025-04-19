json.extract! resource, :id, :title, :content, :category, :created_at, :updated_at
json.url resource_url(resource, format: :json)
