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

flat1 = { user: first_user, price: "199", title: "Dream Flat", city: "London", address: "7 Boundary St, London E2 7JE", total_occupancy: "1 Guest", room_type: "Single Room"  }
flat2 = { user: first_user, price: "239", title: "One Place, Many Things", city: "London", address: "56A Shoreditch High St, London E1 6PQ", total_occupancy: "2 Guest", room_type: "Double Room" }
flat3 = { user: first_user, price: "249", title: "The joy of Living in Luxury", city: "Paris", address: "75008 Paris", total_occupancy: "4 or more guest", room_type: "Single Room" }
flat4 =  { user: first_user, price: "90", title: "The Right Place To Live", city: "Southampton", address: "High St, Southampton", total_occupancy: "4 or more guest", room_type: "Family Room" }
flat5 =  { user: first_user, price: "120", title: "A dreamy atmosphere", city: "Manchester", address: "Duke St, Manchester", total_occupancy: "4 or more guest", room_type: "Others" }
flat6 =  { user: first_user, price: "149.99", title: "Happy People, Happy Living", city: "London", address: "High St, london", total_occupancy: "4 or more guest", room_type: "Family Room" }
flats = [flat1, flat2, flat3, flat4, flat5, flat6]
i = 0
file1 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915975/firstflat1_ulcfln.jpg")
file2 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915975/flats_5_ihdpyg.jpg")
file3 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915975/flats_6_xmd9e2.jpg")
file4 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915974/flat_4_qrzubn.webp")
file5 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915973/room1_v4zt3c.jpg")
file6 = URI.open("https://res.cloudinary.com/doii0loun/image/upload/v1669915973/room2_e8ojxy.webp")
files = [file1, file2, file3, file4, file5, file6]


files.each do |file|
  @flat = Flat.new(flats[i])
  @flat.photo.attach(io: file, filename: "file#{i + 1}.jpeg", content_type: "image/png")
  @flat.save
  puts "Created #{@flat.title}"
  i += 1
end

# [flat1, flat2, flat3, flat4, flat5, flat6].each do |attributes|
#   @flat = Flat.new(attributes)
#   @flat.photo.attach(io: file, filename: "file1.jpeg", content_type: "image/png")
#   @flat.save
#   puts "Created #{@flat.title}"
# end

puts "Finished!"
