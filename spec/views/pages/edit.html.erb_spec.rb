require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      title: "MyText",
      subtitle: "MyText",
      content: "MyText",
      slug: "MyText",
      tags: "MyText",
      private: false
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "textarea#page_title[name=?]", "page[title]"

      assert_select "textarea#page_subtitle[name=?]", "page[subtitle]"

      assert_select "textarea#page_content[name=?]", "page[content]"

      assert_select "textarea#page_slug[name=?]", "page[slug]"

      assert_select "textarea#page_tags[name=?]", "page[tags]"

      assert_select "input#page_private[name=?]", "page[private]"
    end
  end
end
