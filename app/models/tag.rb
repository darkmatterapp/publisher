class Tag < ActiveRecord::Base
  has_many :taggings

  before_create :set_slug
  before_update :set_slug

  # TODO: create slug before validation to prevent case sensitivity
  validates :slug, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def private_tag?
    name.match(/^\./)
  end

  private

  # TODO: DRY refactor this method copied from PostType into a lib?
  def clean_slug!
    blank     = ""
    separator = "-"
    self.slug = slug.downcase
      .gsub(/\(|\)|\[|\]\./, blank)
      .gsub(/&amp;/,         blank)
      .gsub(/\W|_|\s|-+/,    separator)
      .gsub(/^-+/,           blank)
      .gsub(/-+$/,           blank)
      .gsub(/--*/,           separator)
  end

  def set_slug
    self.slug = name if slug.blank?
    clean_slug!
  end
end
