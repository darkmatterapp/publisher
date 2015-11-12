class ChangeKeyToSlugOnSetting < ActiveRecord::Migration
  def change
    rename_column :settings, :key, :slug
  end
end