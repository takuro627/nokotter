class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.save
    # redirect_to ("/tweets/#{params[:tweet_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    # redirect_to ("/tweets/#{params[:tweet_id]}")
  end

  private

  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
  end
end
