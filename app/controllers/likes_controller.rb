class LikesController < ApplicationController
  before_action :set_variables

  def like
    @like = Like.new(user_id: @current_user_id, tweet_id: params[:tweet_id])
    @like.save
  end

  def unlike
    @like = Like.find_by(user_id: @current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
  end

  private

  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
  end
end
