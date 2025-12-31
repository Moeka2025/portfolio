class AddCorrectColumnsToSpotTags < ActiveRecord::Migration[6.1]
  def change
    add_column :spot_tags, :spot_id, :integer
    add_column :spot_tags, :tag_id, :integer
  end
end
