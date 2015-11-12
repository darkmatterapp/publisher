require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      url: "MyText",
      name: "MyString",
      user_id: 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "textarea#link_url[name=?]", "link[url]"

      assert_select "input#link_name[name=?]", "link[name]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
