# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.destroy_all
# Expense.destroy_all

# Create 3 users
3.times do |i|
  user = User.create(
    username: "User#{i+1}", 
    email: "user#{i+1}@example.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password',
    password_confirmation: 'password'
    )

  # Create 5 expenses for each user
  10.times do |j|
    Expense.create(
      user: user,
      category_id: rand(1..12),
      amount: rand(10..1000),
      date: Faker::Date.between(from: 1.month.ago, to: Date.today)
    )
  end
end



# (1..3).each do |i|
#     user = User.create(
#         username: Faker::Internet.username(specifier: 3..20, separators: %w(_)),
#         email: Faker::Internet.email,
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         password: 'password',
#         password_confirmation: 'password'
#     )

#     rand(1..10).times do
#         user.expenses.create(
#             date: Faker::Date.forward(days:15),
#             title: Faker::Lorem.word,
#             description: Faker::Lorem.sentence,
#             amount: rand(20..500),
#             category_id: rand(1..10),
        
#         )
#     end
# end

