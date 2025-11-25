# if Rails.env.development?
#   AdminUser.where(email: "admin@example.com").first_or_initialize.tap do |admin|
#     admin.password = "password"
#     admin.password_confirmation = "password"
#     admin.save!
#   end
# end

# PageContent.find_or_create_by(name: "about")
# PageContent.find_or_create_by(name: "contact")

require "faker"

puts "Clearing old data..."
Product.destroy_all
Category.destroy_all

puts "Creating categories..."
categories = [
  "Courses",
  "Templates",
  "Software Tools",
  "Digital Assets"
].map do |name|
  Category.create!(name: name)
end

puts "Creating products..."
100.times do
  category = categories.sample

  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    base_price: Faker::Commerce.price(range: 10..200),
    category: Category.all.sample
  )

  product.images.attach(
  io: File.open(Rails.root.join("db/seed_images/sample1.jpg")),
  filename: "sample1.jpg",
  content_type: "image/jpeg"
)
end

puts "Done! Seeded #{Category.count} categories and #{Product.count} products."
