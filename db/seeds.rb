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
user_role      = Role.find_or_create_by!(name: "user")
moderator_role = Role.find_or_create_by!(name: "moderator")
admin_role     = Role.find_or_create_by!(name: "admin")

# Create test user
user = User.find_or_initialize_by(email: "user@the-sewcial-exchange.onrender.com")
user.first_name = "Regular"
user.last_name = "User"
user.address_line1 = "123 Main St"
user.city = "Townsville"
user.state = "OH"
user.zip = "12345"
user.display_name = "RegularUser"
user.password = "password"
user.password_confirmation = "password"
user.save!

# Create moderator
moderator = User.find_or_initialize_by(email: "moderator@the-sewcial-exchange.onrender.com")
moderator.first_name = "Mod"
moderator.last_name = "Erator"
moderator.address_line1 = "456 Elm St"
moderator.city = "Townsville"
moderator.state = "OH"
moderator.zip = "12345"
moderator.display_name = "ModMan"
moderator.password = "password"
moderator.password_confirmation = "password"
moderator.save!

# Create admin
admin = User.find_or_initialize_by(email: "admin@the-sewcial-exchange.onrender.com")
admin.first_name = "Admin"
admin.last_name = "Istrator"
admin.address_line1 = "789 Oak St"
admin.city = "Townsville"
admin.state = "OH"
admin.zip = "12345"
admin.display_name = "AdminBoss"
admin.password = "password"
admin.password_confirmation = "password"
admin.save!

# Assign roles
user.roles << user_role unless user.roles.include?(user_role)
moderator.roles << moderator_role unless moderator.roles.include?(moderator_role)
admin.roles << admin_role unless admin.roles.include?(admin_role)


# Create sample swaps
puts "Creating sample swaps..."

admin = User.find_by(email: "admin@the-sewcial-exchange.onrender.com")
group = SwapGroup.first || SwapGroup.create!(name: "Sample Group", description: "A test swap group", created_by_id: admin.id)

Swap.create!([
  {
    title: "Scrappy Summer Swap",
    theme: "seasonal",
    deadline: Date.today + 30.days,
    status: "active",
    rules: "Make a 12\" block using summer colors.",
    form_url: "https://forms.gle/sample1",
    swap_group: group,
    created_by_id: admin.id
  },
  {
    title: "Mini Quilt Magic",
    theme: "mini quilt",
    deadline: Date.today + 45.days,
    status: "active",
    rules: "Sew a mini quilt no larger than 24\" square.",
    form_url: "https://forms.gle/sample2",
    swap_group: group,
    created_by_id: admin.id
  },
  {
    title: "Filled with Joy",
    theme: "seasonal",
    deadline: Date.today + 60.days,
    status: "active",
    rules: "Create a themed surprise swap with festive holiday flair filled with joy.",
    form_url: "https://forms.gle/sample3",
    swap_group: group,
    created_by_id: admin.id
  }
])
