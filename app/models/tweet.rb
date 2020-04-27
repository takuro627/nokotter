class Tweet < ApplicationRecord
  validates :content, presence: true, unless: :image?
  belongs_to :user

  mount_uploader :image, ImageUploader
end
