# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
puts "Bookings deleted"
Flat.destroy_all
puts "Flats deleted"
User.destroy_all
puts "Users deleted"

puts "\ncreating users..."
first_user = User.create!(email: "jones_wong@icloud.com", password: "jones_wong@icloud.com")
puts "#{first_user.email} is created"

puts "Creating flats..."

flat1 = { user: first_user, price: "100", title: "Flat 1", city: "London", address: "7 Boundary St, London E2 7JE", total_occupancy: "1", room_type: "single"  }
flat2 = { user: first_user, price: "102", title: "Flat 2", city: "London", address: "56A Shoreditch High St, London E1 6PQ", total_occupancy: "2", room_type: "double" }
flat3 = { user: first_user, price: "105", title: "Flat 3", city: "Paris", address: "75008 Paris", total_occupancy: "4", room_type: "single" }
flat4 =  { user: first_user, price: "250", title: "Flat 4", city: "Southampton", address: "High St, Southampton", total_occupancy: "5", room_type: "double" }
flat5 =  { user: first_user, price: "200", title: "Flat 5", city: "Menchester", address: "High St, Menchester", total_occupancy: "6", room_type: "family" }
flat6 =  { user: first_user, price: "205", title: "Flat 6", city: "London", address: "High St, london", total_occupancy: "4", room_type: "family" }

[flat1, flat2, flat3, flat4, flat5, flat6].each do |attributes|
  file = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
  @flat = Flat.new(attributes)
  @flat.photo.attach(io: file, filename: "file1.jpeg", content_type: "image/png")
  @flat.save
  puts "Created #{@flat.title}"
end

# file2 = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
# flat2.photo.attach(io: file2, filename: "file2.jpeg", content_type: "image/png")
# file3 = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
# flat3.photo.attach(io: file3, filename: "file3.jpeg", content_type: "image/png")
# file4 = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
# flat4.photo.attach(io: file4, filename: "file4.jpeg", content_type: "image/png")
# file5 = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
# flat5.photo.attach(io: file5, filename: "file5.jpeg", content_type: "image/png")
# file6 = URI.open("https://lh3.googleusercontent.com/blogger_img_proxy/ANbyha2ZclDOOI2jWMayud6MxiHtrzBB5oyNHVXYIw0hkncOCHnHbsjQxaAg16Yb6AQ3kMKhPvZ5n0lv9E6ugFvDKoc8oMgCetuioqAslhtte7FvMwN8gif8h-4BbeXMAsRjZ7Ip4Lhx-xLk3FAalpI99wIGbnF7g4yD31_k0dfL=s0-d")
# flat6.photo.attach(io: file6, filename: "file6.jpeg", content_type: "image/png")

puts "Finished!"
