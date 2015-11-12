require 'rails_helper'

RSpec.describe "settings/index", type: :view do
  before(:each) do
    assign(:settings, [
      Setting.create!(
        name: "Name",
        slug: "Key",
        content: "MyText",
        editable: false
      ),
      Setting.create!(
        name: "Name",
        slug: "Key",
        content: "MyText",
        editable: false
      )
    ])
  end

  it "renders a list of settings" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Key".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
