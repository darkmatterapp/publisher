require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Video. As you add validations to Video, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # VideosController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all videos as @posts" do
  #     post = Video.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:posts)).to eq([post])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested video as @post" do
  #     post = Video.create! valid_attributes
  #     get :show, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new video as @post" do
  #     get :new, {}, valid_session
  #     expect(assigns(:post)).to be_a_new(Video)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested video as @post" do
  #     post = Video.create! valid_attributes
  #     get :edit, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Video" do
  #       expect {
  #         post :create, {video: valid_attributes}, valid_session
  #       }.to change(Video, :count).by(1)
  #     end
  #
  #     it "assigns a newly created video as @post" do
  #       post :create, {video: valid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a(Video)
  #       expect(assigns(:post)).to be_persisted
  #     end
  #
  #     it "redirects to the created video" do
  #       post :create, {video: valid_attributes}, valid_session
  #       expect(response).to redirect_to(Video.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved video as @post" do
  #       post :create, {video: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a_new(Video)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {video: invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) do
  #       skip("Add a hash of attributes valid for your model")
  #     end
  #
  #     it "updates the requested video" do
  #       post = Video.create! valid_attributes
  #       put :update, {id: post.to_param, video: new_attributes}, valid_session
  #       post.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested video as @post" do
  #       post = Video.create! valid_attributes
  #       put :update, {id: post.to_param, video: valid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "redirects to the video" do
  #       post = Video.create! valid_attributes
  #       put :update, {id: post.to_param, video: valid_attributes}, valid_session
  #       expect(response).to redirect_to(video)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the video as @post" do
  #       post = Video.create! valid_attributes
  #       put :update, {id: post.to_param, video: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       post = Video.create! valid_attributes
  #       put :update, {id: post.to_param, video: invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested video" do
  #     post = Video.create! valid_attributes
  #     expect do
  #       delete :destroy, {id: post.to_param}, valid_session
  #     end.to change(Video, :count).by(-1)
  #   end
  #
  #   it "redirects to the videos list" do
  #     post = Video.create! valid_attributes
  #     delete :destroy, {id: post.to_param}, valid_session
  #     expect(response).to redirect_to(videos_url)
  #   end
  # end

end
