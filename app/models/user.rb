class User < ApplicationRecord
  has_secure_password

  has_many :pets, dependent: :destroy
  enum :role, { client: 0, admin: 1 }
end
