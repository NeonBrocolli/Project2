class User < ApplicationRecord
  has_secure_password
  has_many :warehouses, dependent: :destroy
  has_many :events, dependent: :destroy

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :email, presence: true, uniqueness: true
  validates :company, presence: true
end
