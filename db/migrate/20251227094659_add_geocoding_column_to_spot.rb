class AddGeocodingColumnToSpot < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :address, :string, null: false, default: ""
    add_column :spots, :latitude, :float, null: false, default: 0
    add_column :spots, :longitude, :float, null: false, default: 0
  end
end
