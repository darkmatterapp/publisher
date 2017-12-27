class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
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
