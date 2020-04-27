class RenameTextColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :text, :content
  end
end
