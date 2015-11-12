class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.text :source_path
      t.text :target_path

      t.timestamps null: false
    end
  end
end
