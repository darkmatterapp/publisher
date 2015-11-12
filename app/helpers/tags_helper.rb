module TagsHelper
  def link_to_tags_for(post)
    html = []

    post.tags.each do |tag|
      if tag.private_tag?
        html << link_to_tag(tag) if signed_in?
      else
        html << link_to_tag(tag)
      end
    end

    html.join(", ").html_safe
  end

  def link_to_tag(tag)
    link_to_unless_current(tag.name, tag_path(tag.slug), class: "p-category", rel: "tag")
  end
end
