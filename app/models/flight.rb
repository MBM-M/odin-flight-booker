class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers, through: :booking

  belongs_to :dep_airport, class_name: "Airport", foreign_key: "dep_airport_id"
  belongs_to :arr_airport, class_name: "Airport", foreign_key: "arr_airport_id"
end
