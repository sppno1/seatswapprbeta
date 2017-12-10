class AddUseridToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :userid, :integer
  end
end
