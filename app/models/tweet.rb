class Tweet < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, unless: :image?
  belongs_to :user

  mount_uploader :image, ImageUploader
  
  before_save { in_reply_to = reply_user.to_s }
  
  def reply_user
    if user_unique_name = content.match(/(@[^\s]+)\s.*/)
      user_unique_name[1]
    end
  end
end
