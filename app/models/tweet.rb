class Tweet < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, unless: :image?
  belongs_to :user

  mount_uploader :image, ImageUploader
end
