class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :post_id
      t.string :post_type

      t.timestamps null: false
    end
  end
end
