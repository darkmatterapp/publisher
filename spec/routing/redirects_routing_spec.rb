require "rails_helper"

RSpec.describe RedirectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/redirects").to route_to("redirects#index")
    end

    it "routes to #new" do
      expect(get: "/redirects/new").to route_to("redirects#new")
    end

    it "routes to #show" do
      expect(get: "/redirects/1").to route_to("redirects#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/redirects/1/edit").to route_to("redirects#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/redirects").to route_to("redirects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/redirects/1").to route_to("redirects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/redirects/1").to route_to("redirects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/redirects/1").to route_to("redirects#destroy", id: "1")
    end

  end
end
