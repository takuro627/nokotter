class Tweet < ApplicationRecord
  validates :text, presence: true, unless: :image?
  belongs_to :user

  mount_uploader :image, ImageUploader
end
