class RemoveTagsFromNotes < ActiveRecord::Migration
  def change
    remove_column :articles, :tags, :string
    remove_column :bookmarks, :tags, :string
    remove_column :events, :tags, :string
    remove_column :notes, :tags, :string
    remove_column :pages, :tags, :string
    remove_column :photos, :tags, :string
    remove_column :sounds, :tags, :string
    remove_column :videos, :tags, :string
  end
end
