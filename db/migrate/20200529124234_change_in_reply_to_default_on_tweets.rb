class ChangeInReplyToDefaultOnTweets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tweets, :in_reply_to, from: "", to: 0
  end
end
