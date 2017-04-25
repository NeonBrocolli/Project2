class User < ApplicationRecord
  has_secure_password
  has_many :warehouses, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :company, presence: true, uniqueness: true
end
