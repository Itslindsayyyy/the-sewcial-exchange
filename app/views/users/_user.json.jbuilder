json.extract! user, :id, :first_name, :last_name, :email, :address_line1, :address_line2, :city, :state, :zip, :instagram_url, :facebook_url, :display_name, :created_at, :updated_at
json.url user_url(user, format: :json)
