class AddTestToTags < ActiveRecord::Migration
  def change
    # just to test auto migrating from .heroku/bin/release
    add_column :tags, :test, :string
  end
end
