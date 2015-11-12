require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
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
      ),
      Event.create!(
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
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
