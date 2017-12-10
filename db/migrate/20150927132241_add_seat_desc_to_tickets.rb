class AddSeatDescToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :seat_desc, :string
  end
end
