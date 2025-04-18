# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create roles if they don't exist
user_role     = Role.find_or_create_by!(name: "user")
moderator_role = Role.find_or_create_by!(name: "moderator")
admin_role    = Role.find_or_create_by!(name: "admin")

# Create test users
user = User.find_or_create_by!(email: "user@example.com") do |u|
  u.first_name = "Regular"
  u.last_name = "User"
  u.address_line1 = "123 Main St"
  u.city = "Townsville"
  u.state = "OH"
  u.zip = "12345"
  u.display_name = "RegularUser"
  u.password = "password"  # if using Devise or has_secure_password
end

moderator = User.find_or_create_by!(email: "moderator@example.com") do |u|
  u.first_name = "Mod"
  u.last_name = "Erator"
  u.address_line1 = "456 Elm St"
  u.city = "Townsville"
  u.state = "OH"
  u.zip = "12345"
  u.display_name = "ModMan"
  u.password = "password"
end

admin = User.find_or_create_by!(email: "admin@example.com") do |u|
  u.first_name = "Admin"
  u.last_name = "Istrator"
  u.address_line1 = "789 Oak St"
  u.city = "Townsville"
  u.state = "OH"
  u.zip = "12345"
  u.display_name = "AdminBoss"
  u.password = "password"
end

# Assign roles
user.roles << user_role unless user.roles.include?(user_role)
moderator.roles << moderator_role unless moderator.roles.include?(moderator_role)
admin.roles << admin_role unless admin.roles.include?(admin_role)
