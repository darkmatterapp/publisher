module SyndicationsHelper
  def link_to_syndications(post)
    links = []

    post.syndications.each do |syndication|
      rel = 'external '
      rel << 'syndication' if show_action?

      links << link_to(syndication.name.capitalize, syndication.url, rel: rel, class: 'u-syndication')
    end

    if links.blank?
      blank
    else
      tag.p("Also posted to #{links.flatten.join(', ')}.".html_safe)
    end
  end

  def syndication_buttons_for(post)
    label = 'Syndicate to'
    links = []

    current_user.providers.each do |provider|
      links << tag.li(button_to(provider.provider.capitalize, syndicators_path(post.namespace, post.id, :twitter), class: 'link')) unless post.syndications.exists?(name: provider.provider)
    end

    if current_user.providers.blank?
      tag.p(link_to('Add Syndication Twitter Key and Syndication Twitter Secret settings to syndicate to Twitter', admin_settings_path))
    elsif links.present?
      [label, tag.ul(links.flatten.join.html_safe)].join.html_safe
    end
  end
end
