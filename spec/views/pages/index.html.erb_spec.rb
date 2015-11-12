require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        title: "MyText",
        subtitle: "MyText",
        content: "MyText",
        slug: "MyText",
        tags: "MyText",
        private: false
      ),
      Page.create!(
        title: "MyText",
        subtitle: "MyText",
        content: "MyText",
        slug: "MyText",
        tags: "MyText",
        private: false
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
