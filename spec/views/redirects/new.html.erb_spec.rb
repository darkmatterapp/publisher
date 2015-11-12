require 'rails_helper'

RSpec.describe "redirects/new", type: :view do
  before(:each) do
    assign(:redirect, Redirect.new(
      source_path: "MyText",
      target_path: "MyText"
    ))
  end

  it "renders new redirect form" do
    render

    assert_select "form[action=?][method=?]", redirects_path, "post" do

      assert_select "textarea#redirect_source_path[name=?]", "redirect[source_path]"

      assert_select "textarea#redirect_target_path[name=?]", "redirect[target_path]"
    end
  end
end
