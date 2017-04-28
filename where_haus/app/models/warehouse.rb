class Warehouse < ApplicationRecord
  belongs_to :user
  has_one :event

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :venue_name, presence: true
  validates :location, presence: true
  validates :num_exits, presence: true
  validates :image, presence: true
end
