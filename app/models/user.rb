class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: :true, on: :create
  validates :email,    presence: :true, uniqueness: true, on: [:create, :update]

  has_many :post_types
  has_many :links
end
