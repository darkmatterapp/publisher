require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      title: "MyText",
      subtitle: "MyText",
      content: "MyText",
      slug: "MyText",
      in_reply_to: "MyText",
      tags: "MyText",
      private: false,
      summary: "MyText",
      url: "MyText",
      organizer_name: "MyText",
      organizer_url: "MyText",
      location_name: "MyText",
      location_url: "MyText",
      location_street_address: "MyText",
      location_extended_street_address: "MyText",
      location_locality: "MyText",
      location_region: "MyText",
      location_country: "MyText",
      location_postal_code: "MyText",
      location_latitude: "MyText",
      location_longitude: "MyText",
      location_altitude: "MyText"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "textarea#event_title[name=?]", "event[title]"

      assert_select "textarea#event_subtitle[name=?]", "event[subtitle]"

      assert_select "textarea#event_content[name=?]", "event[content]"

      assert_select "textarea#event_slug[name=?]", "event[slug]"

      assert_select "textarea#event_in_reply_to[name=?]", "event[in_reply_to]"

      assert_select "textarea#event_tags[name=?]", "event[tags]"

      assert_select "input#event_private[name=?]", "event[private]"

      assert_select "textarea#event_summary[name=?]", "event[summary]"

      assert_select "textarea#event_url[name=?]", "event[url]"

      assert_select "textarea#event_organizer_name[name=?]", "event[organizer_name]"

      assert_select "textarea#event_organizer_url[name=?]", "event[organizer_url]"

      assert_select "textarea#event_location_name[name=?]", "event[location_name]"

      assert_select "textarea#event_location_url[name=?]", "event[location_url]"

      assert_select "textarea#event_location_street_address[name=?]", "event[location_street_address]"

      assert_select "textarea#event_location_extended_street_address[name=?]", "event[location_extended_street_address]"

      assert_select "textarea#event_location_locality[name=?]", "event[location_locality]"

      assert_select "textarea#event_location_region[name=?]", "event[location_region]"

      assert_select "textarea#event_location_country[name=?]", "event[location_country]"

      assert_select "textarea#event_location_postal_code[name=?]", "event[location_postal_code]"

      assert_select "textarea#event_location_latitude[name=?]", "event[location_latitude]"

      assert_select "textarea#event_location_longitude[name=?]", "event[location_longitude]"

      assert_select "textarea#event_location_altitude[name=?]", "event[location_altitude]"
    end
  end
end
