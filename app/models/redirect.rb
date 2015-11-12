class Redirect < ActiveRecord::Base
  validates :source_path, presence: true
  validates :target_path, presence: true

  before_create :clean_paths!
  before_update :clean_paths!

  private

  def clean_paths!
    strip_whitespace!
    remove_leading_slash!
    remove_protocol!
    remove_domain!
    remove_trailing_slash!
    strip_whitespace!
  end

  def add_leading_slash!
    self.source_path = "/#{source_path}" unless source_path.match(%r{^\/})
    self.target_path = "/#{target_path}" unless target_path.match(%r{^\/})
  end

  def remove_protocol!
    protocol_regex = %r{https*:\/\/}
    self.source_path = source_path.sub(protocol_regex, "")
    self.target_path = target_path.sub(protocol_regex, "")
  end

  def remove_leading_slash!
    self.source_path = source_path.sub(%r{^\/}, "")
    self.target_path = target_path.sub(%r{^\/}, "")
  end

  def remove_domain!
    self.source_path = source_path.split("/")[1..-1].join("/") if source_path.match(/\./)
    self.target_path = target_path.split("/")[1..-1].join("/") if target_path.match(/\./)
  end

  def remove_trailing_slash!
    self.source_path = source_path.sub(%r{$\/}, "")
    self.target_path = target_path.sub(%r{$\/}, "")
  end

  def strip_whitespace!
    source_path.strip!
    target_path.strip!
  end
end
