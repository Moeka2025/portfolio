class AddTagIdToSpotTags < ActiveRecord::Migration[6.1]
  def change
    add_column :spot_tags, :tag, :integer
  end
end
