class PostType < ActiveRecord::Base
  has_one :post, as: :post_type
  delegate :path,
           :name,
           :private,
           :private?,
           :in_reply_to,
           :in_reply_to?,
           :published_at,
           :slug,
           :title,
           :subtitle,
           :content,
           to: :post,
           allow_nil: true

  self.abstract_class = true

  class << self
    attr_reader :fallback_attribute
  end

  # default_scope { order("published_at DESC") }

  belongs_to :user

  def self.inherited(child)
    child.class_eval do
      scope :invisible, -> { includes(:post).where(posts: {private: true}) }
      scope :visible, -> { includes(:post).where(posts: {private: false}) }
    end
    super
  end

  def self.fallback_attr(attr)
    @fallback_attribute = attr
    validates @fallback_attribute, presence: true
  end

  def fallback_name
    fallback_attribute.split("/").last.split(".").first
  end

  def params
    {year: published_at.year, month: published_at.month, day: published_at.day, slug: slug}
  end

  def public?
    !private?
  end

  def fallback_attribute
    send(self.class.fallback_attribute)
  end
end
