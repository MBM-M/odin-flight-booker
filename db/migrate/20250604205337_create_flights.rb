class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.integer :arr_airport_id
      t.integer :dep_airport_id
      t.datetime :start_datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
