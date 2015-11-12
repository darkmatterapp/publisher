class TagsController < ApplicationController
  def index
    @tags = []

    Tag.all.each do |tag|
      if signed_in?
        @tags << tag
      elsif !tag.private_tag?
        @tags << tag
      end
    end

    @tags.sort_by! { |tag| tag.name.downcase }
  end

  def show
    @tag = Tag.where(slug: params[:slug]).first
    return redirect_to(root_path) if @tag.private_tag? && !signed_in?
  end
end
