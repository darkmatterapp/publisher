class TagsController < ApplicationController
  def index
    @tags = []

    Tag.all.each do |tag|
      @tags << tag if signed_in? || tag.public_tag?
    end

    @tags.sort_by! { |tag| tag.name.downcase }
  end

  def show
    @tag = Tag.find_by(slug: params[:id])

    return redirect_to(tags_path) if @tag.blank? || (@tag.private_tag? && !signed_in?)
  end
end
