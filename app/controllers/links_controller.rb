class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :authorize
  before_action :all_links

  def index
    @slug = "links"
    @links = Link.all
  end

  def show
    redirect_to links_path
  end

  def new
    @link = Link.new
  end

  def edit
    @slug = "links"
    @page_title = "Editing Link : #{@link.name}"
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to links_url, notice: "Link was successfully created."
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to links_url, notice: "Link was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url,
      :name,
      :user_id)
  end

  def all_links
    @links = Link.where(user_id: current_user.id).all
  end
end
