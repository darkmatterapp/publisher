class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Video.paginate(page: params[:page]).all
    else
      @posts = Video.visible.paginate(page: params[:page]).all
    end

    render "/posts/index"
  end

  def show
    render "/posts/show"
  end

  def new
    @post = PostForm.new(Video)
  end

  def edit
    @post = PostForm.new(Video, @post)
  end

  def create
    @post = PostForm.new(Video)

    if @post.submit(params[:video])
      save_tags(@post, video_params)
      redirect_to @post.path, notice: "Video was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(video_params)
      save_tags(@post, video_params)
      redirect_to @post.path, notice: "Video was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to videos_url, notice: "Video was successfully destroyed."
  end

  private

  def set_video
    @post = Post.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def video_params
    params.require(:video).permit(:captured_at, :content, :duration, :enclosure_url,
      :height, :image_url, :in_reply_to, :private, :published_at, :slug, :subtitle,
      :tags, :title, :width)
  end
end
