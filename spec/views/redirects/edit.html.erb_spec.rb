require 'rails_helper'

RSpec.describe "redirects/edit", type: :view do
  before(:each) do
    @redirect = assign(:redirect, Redirect.create!(
      source_path: "MyText",
      target_path: "MyText"
    ))
  end

  it "renders the edit redirect form" do
    render

    assert_select "form[action=?][method=?]", redirect_path(@redirect), "post" do

      assert_select "textarea#redirect_source_path[name=?]", "redirect[source_path]"

      assert_select "textarea#redirect_target_path[name=?]", "redirect[target_path]"
    end
  end
end
