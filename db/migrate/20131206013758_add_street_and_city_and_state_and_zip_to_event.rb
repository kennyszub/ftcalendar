class AddStreetAndCityAndStateAndZipToEvent < ActiveRecord::Migration
  def change
    add_column :events, :street, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :zip, :string
  end
end
