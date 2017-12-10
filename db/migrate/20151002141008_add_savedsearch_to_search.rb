class AddSavedsearchToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :savedsearch, :boolean
  end
end
