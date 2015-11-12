class RedirectsController < ApplicationController
  before_action :set_redirect, only: [:edit, :update, :destroy]
  before_action :authorize

  def index
    @redirects = Redirect.all
    @slug = "redirects"
    @page_title = "Redirects Manager"
  end

  def show
  end

  def new
    @redirect = Redirect.new
  end

  def edit
    @slug = "redirects"
    @page_title = "Editing Redirect"
  end

  def create
    @redirect = Redirect.new(redirect_params)

    if @redirect.save
      redirect_to redirects_path, notice: "Redirect was successfully created."
    else
      render :new
    end
  end

  def update
    if @redirect.update(redirect_params)
      redirect_to redirects_path, notice: "Redirect was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @redirect.destroy
    redirect_to redirects_path, notice: "Redirect was successfully destroyed."
  end

  private

  def set_redirect
    @redirect = Redirect.find(params[:id])
  end

  def redirect_params
    params.require(:redirect).permit(:source_path, :target_path)
  end
end
