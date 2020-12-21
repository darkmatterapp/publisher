class Photo < PostType
  def enclosure_url
    image_url
  end
end
