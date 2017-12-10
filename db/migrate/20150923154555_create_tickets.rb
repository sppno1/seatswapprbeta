class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :departure_airport
      t.string :airline
      t.string :flight_num
      t.date :departure_date
      t.time :departure_time
      t.string :seat_num
      t.decimal :price

      t.timestamps null: false
    end
  end
end
