class RemoveWrongColumnsFromSpotTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :spot_tags, :spot, :integer
    remove_column :spot_tags, :tag, :integer
  end
end
