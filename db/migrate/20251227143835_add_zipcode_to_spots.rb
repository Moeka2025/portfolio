class AddZipcodeToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :zipcode, :string
  end
end
