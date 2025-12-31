class RenameIntroducitonToIntroduction < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introduciton, :introduction
  end
end
