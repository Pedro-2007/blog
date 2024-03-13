class User < ApplicationRecord
  has_many :posts
  has_many :comment
  has_secure_password
end