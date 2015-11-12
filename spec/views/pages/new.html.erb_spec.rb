require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      title: "MyText",
      subtitle: "MyText",
      content: "MyText",
      slug: "MyText",
      tags: "MyText",
      private: false
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "textarea#page_title[name=?]", "page[title]"

      assert_select "textarea#page_subtitle[name=?]", "page[subtitle]"

      assert_select "textarea#page_content[name=?]", "page[content]"

      assert_select "textarea#page_slug[name=?]", "page[slug]"

      assert_select "textarea#page_tags[name=?]", "page[tags]"

      assert_select "input#page_private[name=?]", "page[private]"
    end
  end
end
