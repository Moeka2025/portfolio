class AddShopNameToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :shop_name, :string
  end
end
