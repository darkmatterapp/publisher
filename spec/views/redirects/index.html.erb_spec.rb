require 'rails_helper'

RSpec.describe "redirects/index", type: :view do
  before(:each) do
    assign(:redirects, [
      Redirect.create!(
        source_path: "MyText",
        target_path: "MyText"
      ),
      Redirect.create!(
        source_path: "MyText",
        target_path: "MyText"
      )
    ])
  end

  it "renders a list of redirects" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
