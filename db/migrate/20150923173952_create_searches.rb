class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :airline
      t.string :flight_num
      t.date :departure_date
      t.string :seat_num
      t.decimal :min_price
      t.decimal :max_price
      t.string :departure_airport

      t.timestamps null: false
    end
  end
end
