require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      url: "MyText",
      name: "Name",
      user_id: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
