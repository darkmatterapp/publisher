# Everything is called @post instead of @page so that other things Just Work
class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Page.all
    else
      @posts = Page.visible.all
    end
  end

  def show
    # find old path and redirect to new one
    redirect = Redirect.find_by(source_path: params[:path])
    return redirect_to("/" + redirect.target_path) unless redirect.nil?

    # if no redirect is found, look page or redirect to home
    @post = Post.find_by(slug: params[:path])
    if @post.nil?
      return redirect_to root_path
    else
      return render "/posts/show"
    end
  end

  def new
    @post = PostForm.new(Page)
  end

  def edit
    @post = PostForm.new(Page, @post)
  end

  def create
    @post = PostForm.new(Page)
    if @post.submit(params[:page])
      save_tags(@post, page_params)
      redirect_to slugged_page_path(@post.post_type.slug), notice: "Page was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Page, @post)
    if @post.update(page_params)
      save_tags(@post, page_params)
      redirect_to slugged_page_path(@post.post_type.slug), notice: "Page was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to pages_url, notice: "Page was successfully destroyed."
  end

  private

  def set_page
    @post = Post.find_by(slug: params[:slug])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def page_params
    params.require(:page).permit(:title,
      :subtitle,
      :content,
      :slug,
      :tags,
      :published_at,
      :private)
  end
end
