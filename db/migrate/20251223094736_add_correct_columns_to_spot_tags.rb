class AddCorrectColumnsToSpotTags < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:spot_tags, :spot_id)
      add_column :spot_tags, :spot_id, :integer
    end

    unless column_exists?(:spot_tags, :tag_id)
      add_column :spot_tags, :tag_id, :integer
    end
  end
end
