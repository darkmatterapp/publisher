module ApplicationHelper
  def hide?(name)
    !show?(name)
  end

  def show_site_nav?
    # hide site if there are no user or no posts
    # TODO: change to Post.count.zero? when Post is implemented
    !(Article.count + Event.count + Note.count + Photo.count + Bookmark.count + Sound.count + Video.count).zero? ||
      User.count.zero?
  end

  def show?(name)
    if setting(name).blank?
      false
    else
      true
    end
  end

  def show_nav_to?(page)
    case page
    when :home
      if (hide?(:header_show_avatar) && hide?(:header_show_site_title)) ||
          (setting(:site_title).blank? && @owner && @owner.avatar.blank?)
        true
      end
    else
      true
    end
  end

  def writing?
    action_name =~ /new|edit/
  end

  def editing?
    action_name == "edit"
  end

  def in_a_list?
    action_name == "index"
  end

  def on_permalink?
    action_name == "show"
  end

  def a_reply?(post)
    post.in_reply_to?
  end

  def license(format = nil)
    output = []
    output << license_name_and_url(format)
    output << license_years_range
    output << authors_name_and_url(format)
    output.flatten.join(format == :html ? " " : "\n\t").html_safe
  end

  def license_name_and_url(format = nil)
    license = License.find(setting(:license))

    if license.name == "All Rights Reserved"
      # Default
      "#{license.name} #{license.short_code}"
    elsif format == :html
      # Creative Commons and Public Domain (CC0) as HTML
      link_to("#{license.name} (#{license.short_code})", license.url, rel: "license")
    else
      # Creative Commons and Public Domain (CC0) as plain text
      ["#{license.name} (#{license.short_code})", license.url]
    end
  end

  def license_years_range
    output = []
    years_range = Time.now.in_time_zone.year

    # first_post      = Post.first
    # first_post_year = first_post.nil? ? years_range : first_post.published_at.year

    # if first_post_year == years_range
    #   output << years_range
    # else
    #   output << "#{first_post_year}&ndash;#{years_range}"
    # end

    # remove this line after the above is TODO(ne)
    output << years_range
  end

  def site_title
    title = ""

    # TODO
    # if setting(:site_title).blank?
    #   title << post_type.capitalize.pluralize
    # else
    title << setting(:site_title)
    # end

    title << " - #{@page_title}" if @page_title

    title.html_safe
  end

  def page_description
    if in_a_list?
      # TODO: implement #post_type: notes, articles, photes, etc
      page_description = "Posts by #{@owner.try(:name)}"
    elsif on_permalink? && @post
      page_description = @post.content
    else
      page_description = setting(:site_description)
    end

    page_description
  end

  def apple_touch_icon_link_tags
    output = []

    # square pixel sizes
    sizes = [57, 60, 72, 76, 114, 120, 144, 152, 180]
    sizes.each do |size|
      dimensions = "#{size}x#{size}"
      href = setting("touch_icon_url_#{dimensions}")
      output << tag(:link, rel: "apple-touch-icon", sizes: dimensions, href: href)
    end

    output.join("\n").html_safe
  end

  def site_url
    setting(:protocol) + setting(:domain)
  end
end
