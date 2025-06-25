class Airport < ApplicationRecord
  has_many :dep_flights, class_name: "Flight", foreign_key: "dep_airport_id", dependent: :destroy
  has_many :arr_flights, class_name: "Flight", foreign_key: "arr_airport_id", dependent: :destroy
end
