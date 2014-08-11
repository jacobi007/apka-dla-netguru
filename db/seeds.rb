# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Category.delete_all
Product.delete_all
Review.delete_all

categories = %w{ Electronics Music Books Software Moto Sports Food Cosmetics }

# create admin
User.create(email: 'jk.kubiak@gmail.com',
            firstname: "Jacek",
            lastname: "Kubiak",
            admin: true,
            password: 'admin1',
            password_confirmation: 'admin1')

5.times do
  User.create(email: Faker::Internet.email,
              firstname: Faker::Name.first_name,
              lastname: Faker::Name.last_name,
              password: 'netguru',
              password_confirmation: 'netguru')
end

categories.each do |category|
  Category.create(name: category)
end

Category.all.each do |category|
  n = rand(5) + 1
  n.times do
    category.products.create(title: Faker::Name.title,
                             description: Faker::Lorem.paragraph() + Faker::Lorem.paragraph() ,
                             price: Faker::Number.number(rand(4) + 1),
                             user_id: User.order("RANDOM()").first.id)
  end
end

Product.all.each do |product|
  n = rand(2) + 1
  n.times do
    product.reviews.create(content: Faker::Lorem.paragraph(rand(5) + 1),
                           rating: rand(5) + 1,
                           user_id: User.order("RANDOM()").first.id)
  end
end
