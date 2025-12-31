class AddSpotIdToSpotTags < ActiveRecord::Migration[6.1]
  def change
    add_column :spot_tags, :spot, :integer
  end
end
