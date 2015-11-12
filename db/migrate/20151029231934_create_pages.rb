class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :slug
      t.text :tags
      t.boolean :show_in_nav
      t.datetime :published_at
      t.boolean :private

      t.timestamps null: false
    end
  end
end
