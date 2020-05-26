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
  scope :including_replies, ->(user){where("in_reply_to = ? OR in_reply_to = ? OR user_id = ?", "", "@#{user.id}\-#{user.nickname.sub(/\s/,'-')}", user.id)}
end
