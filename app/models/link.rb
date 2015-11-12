class Link < ActiveRecord::Base
  validates :name, presence: true
  validates :url,  presence: true
  default_scope { order(:name) }
  belongs_to :user
end
