class CreateLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :links do |t|
      t.text :url
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
