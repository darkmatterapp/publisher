require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      name: "MyString",
      slug: "MyString",
      content: "MyText",
      editable: false
    ))
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do

      assert_select "input#setting_name[name=?]", "setting[name]"

      assert_select "input#setting_key[name=?]", "setting[key]"

      assert_select "textarea#setting_content[name=?]", "setting[content]"

      assert_select "input#setting_editable[name=?]", "setting[editable]"
    end
  end
end
