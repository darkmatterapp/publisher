require 'rails_helper'

RSpec.describe "redirects/show", type: :view do
  before(:each) do
    @redirect = assign(:redirect, Redirect.create!(
      source_path: "MyText",
      target_path: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
