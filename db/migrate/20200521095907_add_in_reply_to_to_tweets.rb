class AddInReplyToToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :in_reply_to, :integer, default: ""
  end
end
