class Event < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :event_name, presence: true
  validates :image, presence: true
end
