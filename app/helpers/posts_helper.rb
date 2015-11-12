module PostsHelper
  def edit_post_path(post)
    if post.is_a?(Page)
      ["pages", post.id, "edit"]
    else
      [post.params[:slug], "edit"]
    end.join("/")
  end

  def post_id_and_classes(post, html_class: "h-entry")
    {
      id: "#{post.class.to_s.downcase}-#{post.id}",
      class: html_class
    }
  end

  def rel_in_reply_to
    on_permalink? ? "in-reply-to external" : "external"
  end

  def link_to_in_reply_to_urls(post)
    links = []
    protocol_regex = %r{https*:\/\/}

    unless post.in_reply_to.blank?
      post.in_reply_to.split.each do |url|
        links << link_to(url.sub(protocol_regex, space), url, class: "u-in-reply-to h-cite", rel: rel_in_reply_to)
      end
    end

    content_tag :ul do
      links.map { |link| concat(content_tag(:li, link)) }
    end
  end

  def human_readable_date(datetime)
    datetime.strftime("%F")
  end

  def human_readable_time(datetime)
    datetime.strftime("%l:%M%p").downcase
  end

  def authors_name_and_url(format = nil)
    # TODO: use current_user.url (? about page) after /profile is expanded
    if format == :html
      link_to(@owner.try(:name), root_url, class: "p-author h-card")
    else
      @owner.try(:name)
    end
  end

  def canonical_url(post = nil)
    # TODO: refactor out complexity
    path =
    if @slug == "profile"
      "profile"
    elsif action_name == "new"
      "/#{controller_name}/new"
    elsif @slug != "settings" && @slug != "links" && @slug != "redirects" && action_name == "edit"
      "#{post.path}/edit"
    elsif post
      post.path
    elsif @slug == "home"
      "/"
    elsif @slug
      "/#{@slug}"
    end

    site_url + path
  end

  def rel_canonical_link_tag(post = nil)
    tag(:link, id: "canonical", rel: "canonical", type: "text/html", href: canonical_url(post))
  end
end
