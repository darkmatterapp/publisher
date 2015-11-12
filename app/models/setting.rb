class Setting < ActiveRecord::Base
  validates :name, presence: true
  validate :special_settings

  default_scope { order(:name) }
  scope :editable, -> { where(editable: true) }

  before_create :set_slug
  before_update :set_slug

  private

  def set_slug
    self.slug = name.downcase.gsub(/\W/, "_").gsub(/__/, "_").gsub(/(^_|_$)/, "")
  end

  def special_settings
    # allow blank
    # TODO: this is a mess
    blankable_settings = /Custom CSS|Footer Show|Header Show|Rel Me|Site Title|Site Description|Public Key/

    if name =~ blankable_settings
      return true
    # only one of three values
    elsif name == "Text Direction"
      unless content =~ /ltr|rtl|auto/i
        errors.add(:content, "must be 'ltr' (left to right) or 'rtl' (right to left) or 'auto'")
      end
    elsif content.blank?
      errors.add(:content, "can not be blank")
    end
  end
end
