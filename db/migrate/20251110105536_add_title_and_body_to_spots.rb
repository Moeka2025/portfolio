class AddTitleAndBodyToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :title, :string
    add_column :spots, :body, :text
  end
end
