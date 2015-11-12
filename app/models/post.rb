class Post < ActiveRecord::Base
  belongs_to :post_type, polymorphic: true

  before_create :set_slug
  before_update :set_slug
  validates :slug, uniqueness: true

  delegate :fallback_name, :fallback_attribute, to: :post_type

  def user
    User.first
  end

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    else
      fallback_name
    end
  end

  def path
    [nil,
     self.post_type_type.downcase.pluralize,
     published_at.year,
     published_at.month,
     published_at.day,
     slug
    ].join("/")
  end

  def tags
    output = []
    Tagging.where(post_type: self.class.to_s.downcase, post_id: id).all.find_each do |tagging|
      output << Tag.find(tagging.tag_id)
    end
    output
  end

  private

  def clean_slug!
    blank     = ""
    separator = "-"
    self.slug = slug.downcase
      .gsub(/\(|\)|\[|\]\./, blank)
      .gsub(/&amp;/,         blank)
      .gsub(/\W|_|\s|-+/,    separator)
      .gsub(/^-+/,           blank)
      .gsub(/-+$/,           blank)
  end

  def set_slug
    self.slug = name.present? ? name : fallback_attribute if slug.blank?
    clean_slug!
  end

  def set_published_at
    self.published_at = Time.now.getlocal if published_at.blank?
  end
end
