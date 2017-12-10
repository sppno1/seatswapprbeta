class UlocationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ulocation, :string
  	add_column :users, :username, :string
  end
end
