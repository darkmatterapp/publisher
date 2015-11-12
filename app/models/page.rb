class Page < PostType
  fallback_attr :content

  def fallback_name
    content[0..50].split[0..-2].join(" ")
  end

  def in_reply_to?
    false
  end
end
