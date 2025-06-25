# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

aaa = Airport.create!(code: "AAA")
bbb = Airport.create!(code: "BBB")
ccc = Airport.create!(code: "CCC")

Flight.create!(
  dep_airport: aaa,
  arr_airport: bbb,
  start_datetime: DateTime.now + 1.day,
  flight_duration: 1
)

Flight.create!(
  dep_airport: aaa,
  arr_airport: ccc,
  start_datetime: DateTime.now + 1.day,
  flight_duration: 2
)

Flight.create!(
  dep_airport: ccc,
  arr_airport: aaa,
  start_datetime: DateTime.now + 1.day,
  flight_duration: 3
)
