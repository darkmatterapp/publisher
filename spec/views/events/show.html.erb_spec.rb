require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
