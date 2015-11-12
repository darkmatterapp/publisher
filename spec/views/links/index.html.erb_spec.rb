require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        url: "MyText",
        name: "Name",
        user_id: 1
      ),
      Link.create!(
        url: "MyText",
        name: "Name",
        user_id: 1
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 1.to_s, count: 2
  end
end
