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

    link_to html.compact.join(", ").html_safe, url, title: "#{event.location} on Open Stree Maps"
  end

  def location_street_address_tag(event)
    content_tag(:span, event.location_street_address,          class: "p-street-address")          unless event.location_street_address.blank?
  end

  def location_extended_street_address(event)
    content_tag(:span, event.location_extended_street_address, class: "p-extended-street-address") unless event.location_extended_street_address.blank?
  end

  def location_locality_tag(event)
    content_tag(:span, event.location_locality,                class: "p-locality")                unless event.location_locality.blank?
  end

  def location_region_tag(event)
    content_tag(:span, event.location_region,                  class: "p-region")                  unless event.location_region.blank?
  end

  def location_postal_code_tag(event)
    content_tag(:span, event.location_country,                 class: "p-country")                 unless event.location_country.blank?
  end

  def location_country_tag(event)
    content_tag(:span, event.location_postal_code,             class: "p-postal-code")             unless event.location_postal_code.blank?
  end
end
