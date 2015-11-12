class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Event.paginate(page: params[:page]).all
    else
      @posts = Event.visible.paginate(page: params[:page]).all
    end

    render "/posts/index"
  end

  def show
    render "/posts/show"
  end

  def new
    @post = Event.new
  end

  def edit
  end

  def create
    @post = Event.new(event_params)

    if @post.save
      save_tags(@post, event_params)
      redirect_to @post.path, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(event_params)
      save_tags(@post, event_params)
      redirect_to @post.path, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @post = Event.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def event_params
    params.require(:event).permit(:title,
      :subtitle, :content, :slug, :in_reply_to, :tags, :published_at, :private, :summary,
      :url, :organizer_name, :organizer_url, :starts_at, :ends_at,
      :location_name, :location_url, :location_street_address,
      :location_extended_street_address, :location_locality, :location_region,
      :location_country, :location_postal_code, :location_latitude, :location_longitude,
      :location_altitude)
  end
end
