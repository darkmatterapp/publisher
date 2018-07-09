class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = 'Sounds'
    @posts = Post.of(:sound).for_user(current_user).page(params[:page]).all.per_page(5)
    render '/posts/index'
  end

  def show
    @page_title = @post.name
    render '/posts/show'
  end

  def new
    @page_title = "New #{post_class}"
    @post = PostForm.new(post_class)
    render 'posts/new', layout: 'admin'
  end

  def edit
    @page_title = "Editing #{post_class}: #{@post.name}"
    @post = PostForm.new(post_class, @post)
    render 'posts/edit', layout: 'admin'
  end

  def create
    @post = PostForm.new(Sound)
    if @post.submit(params[:sound])
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: 'Sound was successfully created.'
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Sound, @post)
    if @post.update(sound_params)
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: 'Sound was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to sounds_url, notice: 'Sound was successfully destroyed.'
  end

  private

  def post_class
    Sound
  end

  def set_sound
    @post = Post.of(:sound).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def sound_params
    params.require(:sound).permit(:title, :subtitle, :content, :slug, :in_reply_to,
                                  :tags, :published_at, :private, :image_url, :duration, :captured_at, :enclosure_url)
  end
end
