# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."

flat1 = { user_id: "1", price: "100", address: "7 Boundary St, London E2 7JE", total_occupancy: "1", room_type: "single"}
flat2 = { user_id: "1", price: "102", address: "56A Shoreditch High St, London E1 6PQ", total_occupancy: "2", room_type: "double"}
flat3 = { user_id: "1", price: "105", address: "75008 Paris", total_occupancy: "4", room_type: "single"}
flat4 =  { user_id: "1", price: "250", address: "High St, Southampton", total_occupancy: "5", room_type: "double"}
flat5 =  { user_id: "1", price: "200", address: "High St, Menchester", total_occupancy: "6", room_type: "family"}
flat6 =  { user_id: "1", price: "205", address: "High St, london", total_occupancy: "4", room_type: "family"}

[flat1, flat2, flat3, flat4, flat5, flat6].each do |attributes|
  @flats = Flat.create!(attributes)
  # puts "Created #{flat.address}"
end
puts "Finished!"
