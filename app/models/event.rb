class Event < PostType
  def location
    [
      location_street_address,
      location_extended_street_address,
      location_locality,
      location_region,
      location_country,
      location_postal_code
    ].compact.join(', ')
  end
end
