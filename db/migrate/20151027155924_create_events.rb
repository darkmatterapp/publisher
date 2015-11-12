class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :slug
      t.text :in_reply_to
      t.text :tags
      t.datetime :published_at
      t.boolean :private
      t.text :summary
      t.text :url
      t.text :organizer_name
      t.text :organizer_url
      t.text :location_name
      t.text :location_url
      t.text :location_street_address
      t.text :location_extended_street_address
      t.text :location_locality
      t.text :location_region
      t.text :location_country
      t.text :location_postal_code
      t.text :location_latitude
      t.text :location_longitude
      t.text :location_altitude
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
