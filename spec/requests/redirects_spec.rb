require 'rails_helper'

RSpec.describe "Redirects", type: :request do
  describe "GET /redirects" do
    it "works! (now write some real specs)" do
      get redirects_path
      expect(response).to have_http_status(200)
    end
  end
end
