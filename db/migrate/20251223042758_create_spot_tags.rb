class CreateSpotTags < ActiveRecord::Migration[6.1]
  def change
    create_table :spot_tags do |t|
      t.integer :spot_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :spot_tags, :spot_id
    add_index :spot_tags, :tag_id
    add_index :spot_tags, [:spot_id, :tag_id],unique: true
  end
end