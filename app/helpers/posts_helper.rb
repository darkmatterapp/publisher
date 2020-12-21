module PostsHelper
  def edit_post_path(post)
    if post.is_a?(Page)
      ['pages', post.id, 'edit']
    else
      [post.path, 'edit']
    end.join('/')
  end

  def post_id_and_classes(post, html_class: post.microformat)
    {
      id: "#{post.type}-#{post.id}",
      class: ["post-type-#{post.type.downcase}", html_class].join(' ')
    }
  end

  def rel_in_reply_to
    on_permalink? ? 'in-reply-to external' : 'external'
  end

  def link_to_in_reply_to_urls(post)
    links = []
    protocol_regex = %r{https*://}

    if post.in_reply_to.present?
      post.in_reply_to.split.each do |url|
        links << link_to(url.sub(protocol_regex, space), url, class: 'u-in-reply-to h-cite', rel: rel_in_reply_to)
      end
    end

    tag.ul do
      links.map { |link| concat(tag.li(link)) }
    end
  end

  def human_readable_date(datetime)
    datetime.strftime('%F')
  end

  def human_readable_time(datetime)
    datetime.strftime('%l:%M%p').downcase
  end

  def authors_name_and_url(format = nil)
    # TODO: use current_user.url (? about page) after /profile is expanded
    if format == :html
      link_to(@owner.try(:name), root_url)
    else
      @owner.try(:name)
    end
  end

  def canonical_url(post = nil)
    # TODO: refactor out complexity
    path =
      if @slug == 'profile'
        'profile'
      elsif action_name == 'new'
        "/#{controller_name}/new"
      elsif @slug != 'settings' && @slug != 'links' && @slug != 'redirects' && action_name == 'edit'
        "#{post.path}/edit"
      elsif post
        post.path
      elsif @slug == 'home'
        '/'
      elsif @slug
        "/#{@slug}"
      end

    site_url + path
  end

  def rel_canonical_link_tag(post = nil)
    tag(:link, id: 'canonical', rel: 'canonical', type: 'text/html', href: canonical_url(post))
  end

  def render_post_type_partial(partial, post)
    render [post.post_type_type.downcase.pluralize, partial].join('/'), post: post.post_type if lookup_context.template_exists?(partial, post.post_type_type.downcase.pluralize, true)
  end
end
