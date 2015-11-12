require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      url: "MyText",
      name: "MyString",
      user_id: 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "textarea#link_url[name=?]", "link[url]"

      assert_select "input#link_name[name=?]", "link[name]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
