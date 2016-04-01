# require 'rails_helper'
#
# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.
#
# RSpec.describe Admin::TagsController, type: :controller do
#
#   # This should return the minimal set of attributes required to create a valid
#   # Admin::Tag. As you add validations to Admin::Tag, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }
#
#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }
#
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # Admin::TagsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "assigns all admin_tags as @admin_tags" do
#       tag = Admin::Tag.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:admin_tags)).to eq([tag])
#     end
#   end
#
#   describe "GET #show" do
#     it "assigns the requested admin_tag as @admin_tag" do
#       tag = Admin::Tag.create! valid_attributes
#       get :show, {:id => tag.to_param}, valid_session
#       expect(assigns(:admin_tag)).to eq(tag)
#     end
#   end
#
#   describe "GET #new" do
#     it "assigns a new admin_tag as @admin_tag" do
#       get :new, {}, valid_session
#       expect(assigns(:admin_tag)).to be_a_new(Admin::Tag)
#     end
#   end
#
#   describe "GET #edit" do
#     it "assigns the requested admin_tag as @admin_tag" do
#       tag = Admin::Tag.create! valid_attributes
#       get :edit, {:id => tag.to_param}, valid_session
#       expect(assigns(:admin_tag)).to eq(tag)
#     end
#   end
#
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Admin::Tag" do
#         expect {
#           post :create, {:admin_tag => valid_attributes}, valid_session
#         }.to change(Admin::Tag, :count).by(1)
#       end
#
#       it "assigns a newly created admin_tag as @admin_tag" do
#         post :create, {:admin_tag => valid_attributes}, valid_session
#         expect(assigns(:admin_tag)).to be_a(Admin::Tag)
#         expect(assigns(:admin_tag)).to be_persisted
#       end
#
#       it "redirects to the created admin_tag" do
#         post :create, {:admin_tag => valid_attributes}, valid_session
#         expect(response).to redirect_to(Admin::Tag.last)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns a newly created but unsaved admin_tag as @admin_tag" do
#         post :create, {:admin_tag => invalid_attributes}, valid_session
#         expect(assigns(:admin_tag)).to be_a_new(Admin::Tag)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, {:admin_tag => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }
#
#       it "updates the requested admin_tag" do
#         tag = Admin::Tag.create! valid_attributes
#         put :update, {:id => tag.to_param, :admin_tag => new_attributes}, valid_session
#         tag.reload
#         skip("Add assertions for updated state")
#       end
#
#       it "assigns the requested admin_tag as @admin_tag" do
#         tag = Admin::Tag.create! valid_attributes
#         put :update, {:id => tag.to_param, :admin_tag => valid_attributes}, valid_session
#         expect(assigns(:admin_tag)).to eq(tag)
#       end
#
#       it "redirects to the admin_tag" do
#         tag = Admin::Tag.create! valid_attributes
#         put :update, {:id => tag.to_param, :admin_tag => valid_attributes}, valid_session
#         expect(response).to redirect_to(tag)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the admin_tag as @admin_tag" do
#         tag = Admin::Tag.create! valid_attributes
#         put :update, {:id => tag.to_param, :admin_tag => invalid_attributes}, valid_session
#         expect(assigns(:admin_tag)).to eq(tag)
#       end
#
#       it "re-renders the 'edit' template" do
#         tag = Admin::Tag.create! valid_attributes
#         put :update, {:id => tag.to_param, :admin_tag => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested admin_tag" do
#       tag = Admin::Tag.create! valid_attributes
#       expect {
#         delete :destroy, {:id => tag.to_param}, valid_session
#       }.to change(Admin::Tag, :count).by(-1)
#     end
#
#     it "redirects to the admin_tags list" do
#       tag = Admin::Tag.create! valid_attributes
#       delete :destroy, {:id => tag.to_param}, valid_session
#       expect(response).to redirect_to(admin_tags_url)
#     end
#   end
#
# end
