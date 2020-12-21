module EventsHelper
  def link_to_location(event)
    url = "http://www.openstreetmap.org/search?query=#{event.location}"
    html = [
      location_street_address_tag(event),
      location_extended_street_address(event),
      location_locality_tag(event),
      location_region_tag(event),
      location_postal_code_tag(event),
      location_country_tag(event)
    ]

    link_to html.compact.join(', ').html_safe, url, title: "#{event.location} on Open Stree Maps"
  end

  def location_street_address_tag(event)
    tag.span(event.location_street_address, class: 'p-street-address') if event.location_street_address.present?
  end

  def location_extended_street_address(event)
    tag.span(event.location_extended_street_address, class: 'p-extended-street-address') if event.location_extended_street_address.present?
  end

  def location_locality_tag(event)
    tag.span(event.location_locality, class: 'p-locality') if event.location_locality.present?
  end

  def location_region_tag(event)
    tag.span(event.location_region, class: 'p-region') if event.location_region.present?
  end

  def location_postal_code_tag(event)
    tag.span(event.location_country, class: 'p-country') if event.location_country.present?
  end

  def location_country_tag(event)
    tag.span(event.location_postal_code, class: 'p-postal-code') if event.location_postal_code.present?
  end
end
